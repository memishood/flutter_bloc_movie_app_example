import 'package:flutter_bloc_movie_app_example/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movies_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this._remote);
  final MoviesRemoteDataSource _remote;

  @override
  Future<MoviesEntity> getLatestMovies() {
    return _remote.getLatestMovies();
  }

  @override
  Future<MoviesEntity> getPopularMovies() {
    return _remote.getPopularMovies();
  }

  @override
  Future<MoviesEntity> getTopRatedMovies() {
    return _remote.getTopRatedMovies();
  }

  @override
  Future<MoviesEntity> getUpcomingMovies() {
    return _remote.getUpcomingMovies();
  }
}
