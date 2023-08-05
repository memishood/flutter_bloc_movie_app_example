import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movies/domain/usecases/get_latest_movies.dart';
import 'package:logger/logger.dart';

part 'latest_event.dart';
part 'latest_state.dart';

class LatestBloc extends Bloc<LatestEvent, LatestState> {
  LatestBloc(
    this._getLatestMovies,
    this._logger,
  ) : super(const LatestLoading()) {
    on<FetchLatest>(
      loadLatestMoviesEvent,
      transformer: restartable(),
    );

    on<_UpdateLatest>(
      (event, emit) {
        _logger.i(
          'Fresh data is fetched from the poll 🔥',
          stackTrace: StackTrace.empty,
        );
        emit(LatestFetched(event.movies));
      },
      transformer: sequential(),
    );

    on<_AddLatestError>(
      (event, emit) {
        _logger.e(
          'Latest movies error',
          error: event.error,
          stackTrace: event.trace,
        );
        emit(LatestError(event.error));
      },
      transformer: droppable(),
    );
  }

  final GetLatestMovies _getLatestMovies;
  final Logger _logger;

  StreamSubscription<List<MovieEntity>>? _subscription;

  void loadLatestMoviesEvent(
    FetchLatest event,
    Emitter<LatestState> emit,
  ) {
    if (!event.expanded) {
      _subscription?.pause();
      return;
    }

    if (_subscription != null) {
      _subscription?.resume();
    } else {
      _subscription = _getLatestMovies().listen(
        (movies) => add(_UpdateLatest(movies)),
        onError: (err, trace) => add(_AddLatestError(err, trace)),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
