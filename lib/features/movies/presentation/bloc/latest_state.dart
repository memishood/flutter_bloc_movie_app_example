part of 'latest_bloc.dart';

abstract class LatestState extends Equatable {
  const LatestState();

  @override
  List<Object> get props => [];
}

class LatestLoading extends LatestState {
  const LatestLoading();
}

class LatestError extends LatestState {
  const LatestError(this.error);
  final Exception error;

  @override
  List<Object> get props => [error];
}

class LatestFetched extends LatestState {
  const LatestFetched(this.movies);
  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}
