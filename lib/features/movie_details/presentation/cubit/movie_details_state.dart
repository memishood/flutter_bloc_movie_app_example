part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsFetched extends MovieDetailsState {
  const MovieDetailsFetched(this.movieDetails);
  final MovieDetailsEntity movieDetails;

  @override
  List<Object> get props => [movieDetails];
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError();
}
