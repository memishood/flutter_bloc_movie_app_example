import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/genre_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/spoken_language_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieDetailsEntity extends Equatable {
  const MovieDetailsEntity(
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  final int id;
  final bool? adult, video;
  final String? homepage,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      status,
      tagline,
      title;
  final int? budget, revenue, voteCount;
  final double? popularity, voteAverage;
  final List<GenreEntity>? genres;
  final List<SpokenLanguageEntity>? spokenLanguages;

  String get image => '${dotenv.get('IMAGE_BASE_URL')}/$posterPath';

  @override
  List<Object?> get props => [
        id,
        adult,
        video,
        homepage,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        status,
        tagline,
        title,
        budget,
        popularity,
        revenue,
        voteAverage,
        voteCount,
        genres,
        spokenLanguages,
      ];
}
