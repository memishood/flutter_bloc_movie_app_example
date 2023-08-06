import 'package:flutter_bloc_movie_app_example/features/movie_details/data/datasources/movie_details_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  const MovieDetailsRepositoryImpl(this._remote);
  final MovieDetailsRemoteDataSource _remote;

  @override
  Future<MovieDetailsEntity> getMovieDetails(int id) {
    return _remote.getMovie(id);
  }
}
