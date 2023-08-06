import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetails {
  const GetMovieDetails(this._repository);
  final MovieDetailsRepository _repository;

  Future<MovieDetailsEntity> call(int id) {
    return _repository.getMovieDetails(id);
  }
}
