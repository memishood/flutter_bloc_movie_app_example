part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {
  const UpcomingInitial();
}

class UpcomingLoading extends UpcomingState {
  const UpcomingLoading();
}

class UpcomingError extends UpcomingState {
  const UpcomingError();
}

class UpcomingFetched extends UpcomingState {
  const UpcomingFetched(this.movies);
  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}
