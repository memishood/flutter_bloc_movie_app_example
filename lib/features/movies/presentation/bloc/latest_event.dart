part of 'latest_bloc.dart';

abstract class LatestEvent extends Equatable {
  const LatestEvent();
}

class FetchLatest extends LatestEvent {
  const FetchLatest(this.expanded);
  final bool expanded;

  @override
  List<Object> get props => [expanded];
}

class _UpdateLatest extends LatestEvent {
  const _UpdateLatest(this.movies);
  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}

class _AddLatestError extends LatestEvent {
  const _AddLatestError(
    this.error,
    this.trace,
  );
  final Exception error;
  final StackTrace trace;

  @override
  List<Object> get props => [error, trace];
}
