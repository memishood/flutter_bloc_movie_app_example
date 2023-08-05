import 'package:dio/dio.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/data/models/movies_response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  ApiClient(this._dio) {
    _configureDio();
  }
  final Dio _dio;

  // Authorization could be done also as creating interceptor
  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
      headers: {
        'Authorization': 'Bearer ${dotenv.get('API_ACCESS_TOKEN')}',
        'accept': 'application/json',
      },
    );
  }

  Future<MoviesResponseModel> getMovies(
    MovieType movieType,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/movie/${movieType.endpoint}',
    );
    return MoviesResponseModel.fromJson(response.data!);
  }
}

// @ApiClient could have had different getters for each movie type but
// Since the structures of response and request are same, It would be duplicated code
// So created an enum for make it generic
enum MovieType {
  latest('now_playing'),
  popular('popular'),
  topRated('top_rated'),
  upcoming('upcoming');

  const MovieType(this.endpoint);
  final String endpoint;
}
