import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/core/di/service_locator.dart';
import 'package:flutter_bloc_movie_app_example/core/extension/widget_extensions.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/presentation/widget/movie_details.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsCubit>(),
      child: const _MovieDetailsPageView(),
    );
  }
}

class _MovieDetailsPageView extends StatefulWidget {
  const _MovieDetailsPageView({super.key});

  @override
  State<StatefulWidget> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<_MovieDetailsPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movie = ModalRoute.of(context)!.settings.arguments as MovieEntity;
      context.read<MovieDetailsCubit>().getMovieDetails(movie.id);
    });
  }

  void _showSnackbarError(String errorMessage) {
    final snackbar = SnackBar(content: Text(errorMessage));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {
          if (state is MovieDetailsError) {
            _showSnackbarError('Getting movie details failed');
          }
        },
        builder: (context, state) => switch (state) {
          MovieDetailsLoading() =>
            const CircularProgressIndicator().paddingAll(12),
          MovieDetailsFetched() =>
            MovieDetails(movieDetails: state.movieDetails),
          MovieDetailsError() => const Icon(Icons.wifi_off),
          _ => const SizedBox.shrink(),
        },
      ).toCenter(),
    );
  }
}
