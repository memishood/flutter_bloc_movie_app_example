import 'package:flutter_bloc_movie_app_example/core/api/api_client.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/datasources/movie_details_remote_data_source.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  const MovieDetailsRemoteDataSourceImpl(this._apiClient);
  final ApiClient _apiClient;

  @override
  Future<MovieDetailsEntity> getMovie(int id) {
    return _apiClient.getMovie(id);
  }
}
