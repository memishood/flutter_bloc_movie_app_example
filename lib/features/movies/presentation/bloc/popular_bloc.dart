import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:logger/logger.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc(
    this._getPopularMovies,
    this._logger,
  ) : super(const PopularInitial()) {
    on<FetchPopular>(
      _fetchPopularMovies,
      transformer: restartable(),
    );
  }

  final GetPopularMovies _getPopularMovies;
  final Logger _logger;

  void _fetchPopularMovies(
    FetchPopular event,
    Emitter<PopularState> emit,
  ) async {
    emit(const PopularLoading());
    try {
      final popularMovies = await _getPopularMovies();
      emit(PopularFetched(popularMovies));
    } catch (err, trace) {
      _logger.e(
        'Popular movies error',
        error: err,
        stackTrace: trace,
      );
      emit(const PopularError());
    }
  }
}
