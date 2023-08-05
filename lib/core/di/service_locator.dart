import 'package:dio/dio.dart';
import 'package:flutter_bloc_movie_app_example/core/api/api_client.dart';
import 'package:flutter_bloc_movie_app_example/core/route/app_router.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/data/datasources/movies_remote_data_source_impl.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/datasources/movies_remote_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void setUp() {
  setUpCommons();
  setUpMoviesPage();
}

void setUpCommons() {
  getIt
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<Logger>(Logger())
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<ApiClient>(ApiClient(getIt()));
}

void setUpMoviesPage() {
  getIt.registerFactory<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourcesImpl(getIt()),
  );
}
