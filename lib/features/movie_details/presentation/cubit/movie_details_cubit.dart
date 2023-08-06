import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_bloc_movie_app_example/features/movie_details/domain/usecases/get_movie_details.dart';
import 'package:logger/logger.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(
    this._getMovieDetails,
    this._logger,
  ) : super(const MovieDetailsInitial());
  final GetMovieDetails _getMovieDetails;
  final Logger _logger;

  Future<void> getMovieDetails(int id) async {
    emit(const MovieDetailsLoading());
    try {
      final movieDetails = await _getMovieDetails(id);
      emit(MovieDetailsFetched(movieDetails));
    } catch (err, trace) {
      _logger.e(
        'Movie details error',
        error: err,
        stackTrace: trace,
      );
      emit(const MovieDetailsError());
    }
  }
}
