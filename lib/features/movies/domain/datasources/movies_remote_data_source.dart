import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movies_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesEntity> getLatestMovies();

  Future<MoviesEntity> getPopularMovies();

  Future<MoviesEntity> getTopRatedMovies();

  Future<MoviesEntity> getUpcomingMovies();
}
