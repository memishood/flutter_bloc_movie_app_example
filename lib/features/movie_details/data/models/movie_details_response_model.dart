import 'package:flutter_bloc_movie_app_example/features/movie_details/data/models/genre_response_model.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/data/models/spoken_language_response_model.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsResponseModel extends MovieDetailsEntity {
  const MovieDetailsResponseModel._(
    super.id,
    super.adult,
    super.budget,
    super.genres,
    super.homepage,
    super.imdbId,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.revenue,
    super.spokenLanguages,
    super.status,
    super.tagline,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  );

  factory MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    final genres = (json['genres'] as List<dynamic>)
        .map((e) => GenreResponseModel.fromJson(e))
        .toList();

    final spokenLanguages = (json['spoken_languages'] as List<dynamic>)
        .map((e) => SpokenLanguageResponseModel.fromJson(e))
        .toList();

    return MovieDetailsResponseModel._(
      json['id'],
      json['adult'],
      json['budget'],
      genres,
      json['homepage'],
      json['imdbId'],
      json['original_language'],
      json['original_title'],
      json['overview'],
      json['popularity'],
      json['poster_path'],
      json['release_date'],
      json['revenue'],
      spokenLanguages,
      json['status'],
      json['tagline'],
      json['title'],
      json['video'],
      json['voteAverage'],
      json['voteCount'],
    );
  }
}
