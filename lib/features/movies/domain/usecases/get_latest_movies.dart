import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/repositories/movies_repository.dart';
import 'package:rxdart/rxdart.dart' as rx;

class GetLatestMovies {
  const GetLatestMovies(this._repository);
  final MoviesRepository _repository;

  Stream<List<MovieEntity>> call() {
    return rx.MergeStream([
      Stream.fromFuture(
        _repository.getLatestMovies(),
      ).asyncMap((event) async => event.movies),
      Stream.periodic(
        const Duration(seconds: 30),
        (_) => _repository.getLatestMovies(),
      ).asyncMap((event) async => (await event).movies),
    ]);
  }
}
