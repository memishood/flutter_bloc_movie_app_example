import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';

class MovieResponseModel extends MovieEntity {
  const MovieResponseModel._(
    super.id,
    super.title,
    super.imageUrl,
  );

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieResponseModel._(
      json['id'],
      json['title'],
      json['poster_path'],
    );
  }
}
