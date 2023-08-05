part of 'popular_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();
}

class FetchPopular extends PopularEvent {
  const FetchPopular();

  @override
  List<Object> get props => [];
}
