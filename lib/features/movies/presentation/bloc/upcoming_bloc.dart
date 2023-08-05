import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:logger/logger.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc(
    this._getUpcomingMovies,
    this._logger,
  ) : super(const UpcomingInitial()) {
    on<FetchUpcoming>(
      _fetchUpcomingMovies,
      transformer: restartable(),
    );
  }

  final GetUpcomingMovies _getUpcomingMovies;
  final Logger _logger;

  Future<void> _fetchUpcomingMovies(
    FetchUpcoming event,
    Emitter<UpcomingState> emit,
  ) async {
    emit(const UpcomingLoading());
    try {
      final upcomingMovies = await _getUpcomingMovies();
      emit(UpcomingFetched(upcomingMovies));
    } catch (err, trace) {
      _logger.e(
        'Upcoming movies error',
        error: err,
        stackTrace: trace,
      );
      emit(const UpcomingError());
    }
  }
}
