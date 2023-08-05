import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/spoken_language_entity.dart';

class SpokenLanguageResponseModel extends SpokenLanguageEntity {
  const SpokenLanguageResponseModel._(
    super.englishName,
    super.iso6391,
    super.name,
  );

  factory SpokenLanguageResponseModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageResponseModel._(
      json['english_name'],
      json['iso_639_1'],
      json['name'],
    );
  }
}
