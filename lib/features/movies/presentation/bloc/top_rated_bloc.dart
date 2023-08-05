import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:logger/logger.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc(
    this._getTopRatedMovies,
    this._logger,
  ) : super(const TopRatedInitial()) {
    on<FetchTopRated>(
      _fetchTopRatedMovies,
      transformer: restartable(),
    );
  }

  final GetTopRatedMovies _getTopRatedMovies;
  final Logger _logger;

  Future<void> _fetchTopRatedMovies(
    FetchTopRated event,
    Emitter<TopRatedState> emit,
  ) async {
    emit(const TopRatedLoading());
    try {
      final topRatedMovies = await _getTopRatedMovies();
      emit(TopRatedFetched(topRatedMovies));
    } catch (err, trace) {
      _logger.e(
        'Top rated movies error',
        error: err,
        stackTrace: trace,
      );
      emit(const TopRatedError());
    }
  }
}
