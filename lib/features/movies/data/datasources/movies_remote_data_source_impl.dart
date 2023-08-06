import 'package:flutter_bloc_movie_app_example/core/api/api_client.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movies_entity.dart';

class MoviesRemoteDataSourcesImpl implements MoviesRemoteDataSource {
  const MoviesRemoteDataSourcesImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<MoviesEntity> getLatestMovies() {
    return _apiClient.getMovies(MovieType.latest);
  }

  @override
  Future<MoviesEntity> getPopularMovies() {
    return _apiClient.getMovies(MovieType.popular);
  }

  @override
  Future<MoviesEntity> getTopRatedMovies() {
    return _apiClient.getMovies(MovieType.topRated);
  }

  @override
  Future<MoviesEntity> getUpcomingMovies() {
    return _apiClient.getMovies(MovieType.upcoming);
  }
}
