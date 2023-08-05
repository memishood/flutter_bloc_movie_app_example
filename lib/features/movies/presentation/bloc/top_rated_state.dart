part of 'top_rated_bloc.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {
  const TopRatedInitial();
}

class TopRatedLoading extends TopRatedState {
  const TopRatedLoading();
}

class TopRatedError extends TopRatedState {
  const TopRatedError();
}

class TopRatedFetched extends TopRatedState {
  const TopRatedFetched(this.movies);
  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}
