import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/genre_entity.dart';

class GenreResponseModel extends GenreEntity {
  const GenreResponseModel._(
    super.id,
    super.name,
  );

  factory GenreResponseModel.fromJson(Map<String, dynamic> json) {
    return GenreResponseModel._(
      json['id'],
      json['name'],
    );
  }
}
