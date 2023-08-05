part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {
  const PopularInitial();
}

class PopularLoading extends PopularState {
  const PopularLoading();
}

class PopularError extends PopularState {
  const PopularError();
}

class PopularFetched extends PopularState {
  const PopularFetched(this.movies);
  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}
