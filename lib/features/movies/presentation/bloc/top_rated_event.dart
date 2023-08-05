part of 'top_rated_bloc.dart';

abstract class TopRatedEvent extends Equatable {
  const TopRatedEvent();
}

class FetchTopRated extends TopRatedEvent {
  const FetchTopRated();

  @override
  List<Object> get props => [];
}
