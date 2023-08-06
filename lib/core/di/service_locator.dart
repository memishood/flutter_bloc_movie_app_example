import 'package:dio/dio.dart';
import 'package:flutter_bloc_movie_app_example/core/api/api_client.dart';
import 'package:flutter_bloc_movie_app_example/core/route/app_router.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/data/datasources/movie_details_remote_data_source_impl.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/datasources/movie_details_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/data/datasources/movies_remote_data_source_impl.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/datasources/movies_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/repositories/movies_repository.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_latest_movies.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/latest_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/popular_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/top_rated_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/presentation/bloc/upcoming_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUp() {
  setUpCommons();
  setUpMoviesPage();
  setUpMovieDetailsPage();
}

void setUpCommons() {
  getIt
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<Logger>(Logger())
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<ApiClient>(ApiClient(getIt()));
}

void setUpMoviesPage() {
  getIt
    ..registerFactory<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourcesImpl(getIt()),
    )
    ..registerFactory<MoviesRepository>(
      () => MoviesRepositoryImpl(getIt()),
    )
    ..registerFactory<GetLatestMovies>(
      () => GetLatestMovies(getIt()),
    )
    ..registerFactory<GetPopularMovies>(
      () => GetPopularMovies(getIt()),
    )
    ..registerFactory<GetTopRatedMovies>(
      () => GetTopRatedMovies(getIt()),
    )
    ..registerFactory<GetUpcomingMovies>(
      () => GetUpcomingMovies(getIt()),
    )
    ..registerFactory<LatestBloc>(
      () => LatestBloc(getIt(), getIt()),
    )
    ..registerFactory<PopularBloc>(
      () => PopularBloc(getIt(), getIt()),
    )
    ..registerFactory<TopRatedBloc>(
      () => TopRatedBloc(getIt(), getIt()),
    )
    ..registerFactory<UpcomingBloc>(
      () => UpcomingBloc(getIt(), getIt()),
    );
}

void setUpMovieDetailsPage() {
  getIt.registerFactory<MovieDetailsRemoteDataSource>(
    () => MovieDetailsRemoteDataSourceImpl(getIt()),
  );
}
