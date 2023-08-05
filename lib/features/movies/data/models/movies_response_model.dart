import 'package:flutter_bloc_movie_app_example/features/movies/data/models/movie_response_model.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movies_entity.dart';

class MoviesResponseModel extends MoviesEntity {
  const MoviesResponseModel._(
    super.page,
    super.movies,
    super.totalPages,
    super.totalMovies,
  );

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    final movies = (json['results'] as List<dynamic>)
        .map((e) => MovieResponseModel.fromJson(e))
        .toList();

    return MoviesResponseModel._(
      json['page'],
      movies,
      json['total_pages'],
      json['total_results'],
    );
  }
}
