import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/core/di/service_locator.dart';
import 'package:flutter_bloc_movie_app_example/core/extension/widget_extensions.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/latest_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/popular_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/top_rated_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/upcoming_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/widget/expandable_card.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/widget/movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LatestBloc>(
          create: (context) => getIt<LatestBloc>(),
        ),
        BlocProvider<PopularBloc>(
          create: (context) => getIt<PopularBloc>(),
        ),
        BlocProvider<TopRatedBloc>(
          create: (context) => getIt<TopRatedBloc>(),
        ),
        BlocProvider<UpcomingBloc>(
          create: (context) => getIt<UpcomingBloc>(),
        ),
      ],
      child: const _MoviesPageView(),
    );
  }
}

class _MoviesPageView extends StatefulWidget {
  const _MoviesPageView({super.key});

  @override
  State<StatefulWidget> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<_MoviesPageView> {
  void _showErrorSnackbar(String errorMessage) {
    final snackbar = SnackBar(
      content: Text(errorMessage),
      duration: const Duration(milliseconds: 900),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: BlocBuilder<PopularBloc, PopularState>(
                builder: (_, state) => switch (state) {
                  PopularFetched() => Image.network(
                      state.movies[Random().nextInt(state.movies.length)].image,
                    ),
                  PopularLoading() =>
                    const CircularProgressIndicator().toCenter(),
                  PopularError() =>
                    const Icon(Icons.wifi_off, size: 64).toCenter(),
                  _ => const SizedBox.shrink(),
                },
              ),
            ),
            SliverList.list(
              children: [
                ExpandableCard(
                  onChanged: (expanded) {
                    context.read<LatestBloc>().add(FetchLatest(expanded));
                  },
                  title: 'Latest movies',
                  initialExpanded: true,
                  expanded: BlocConsumer<LatestBloc, LatestState>(
                    listener: (context, state) {
                      if (state is LatestError) {
                        _showErrorSnackbar('Getting latest movies failed');
                      }
                    },
                    builder: (_, state) => switch (state) {
                      LatestLoading() => const CircularProgressIndicator()
                          .toCenter()
                          .paddingAll(12),
                      LatestFetched() => MoviesList(
                          onTap: (movie) {},
                          movies: state.movies,
                        ),
                      _ => const SizedBox.shrink()
                    },
                  ),
                ),
                ExpandableCard(
                  title: 'Popular movies',
                  onChanged: (expanded) {
                    if (expanded) {
                      context.read<PopularBloc>().add(const FetchPopular());
                    }
                  },
                  initialExpanded: true,
                  expanded: BlocConsumer<PopularBloc, PopularState>(
                    listener: (context, state) {
                      if (state is PopularError) {
                        _showErrorSnackbar('Getting popular movies failed');
                      }
                    },
                    builder: (_, state) => switch (state) {
                      PopularLoading() => const CircularProgressIndicator()
                          .toCenter()
                          .paddingAll(12),
                      PopularFetched() => MoviesList(
                          onTap: (movie) {},
                          movies: state.movies,
                        ),
                      _ => const SizedBox.shrink()
                    },
                  ),
                ),
                ExpandableCard(
                  title: 'Top rated movies',
                  onChanged: (expanded) {
                    if (expanded) {
                      context.read<TopRatedBloc>().add(const FetchTopRated());
                    }
                  },
                  expanded: BlocConsumer<TopRatedBloc, TopRatedState>(
                    listener: (context, state) {
                      if (state is TopRatedError) {
                        _showErrorSnackbar('Getting top rated movies failed');
                      }
                    },
                    builder: (_, state) => switch (state) {
                      TopRatedLoading() => const CircularProgressIndicator()
                          .toCenter()
                          .paddingAll(12),
                      TopRatedFetched() => MoviesList(
                          onTap: (movie) {},
                          movies: state.movies,
                        ),
                      _ => const SizedBox.shrink()
                    },
                  ),
                ),
                ExpandableCard(
                  title: 'Upcoming movies',
                  onChanged: (expanded) {
                    if (expanded) {
                      context.read<UpcomingBloc>().add(const FetchUpcoming());
                    }
                  },
                  expanded: BlocConsumer<UpcomingBloc, UpcomingState>(
                    listener: (context, state) {
                      if (state is UpcomingError) {
                        _showErrorSnackbar('Getting upcoming movies failed');
                      }
                    },
                    builder: (_, state) => switch (state) {
                      UpcomingLoading() => const CircularProgressIndicator()
                          .toCenter()
                          .paddingAll(12),
                      UpcomingFetched() => MoviesList(
                          onTap: (movie) {},
                          movies: state.movies,
                        ),
                      _ => const SizedBox.shrink()
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
