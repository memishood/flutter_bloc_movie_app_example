import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsEntity> getMovieDetails(int id);
}
