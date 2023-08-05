import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/repositories/movies_repository.dart';

class GetPopularMovies {
  const GetPopularMovies(this._repository);
  final MoviesRepository _repository;

  Future<List<MovieEntity>> call() async {
    final popularMovies = await _repository.getPopularMovies();
    return popularMovies.movies;
  }
}
