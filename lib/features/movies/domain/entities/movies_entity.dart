import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';

class MoviesEntity extends Equatable {
  const MoviesEntity(
    this.page,
    this.movies,
    this.totalPages,
    this.totalMovies,
  );

  final int page, totalPages, totalMovies;
  final List<MovieEntity> movies;

  @override
  List<Object?> get props => [page, movies, totalPages, totalMovies];
}
