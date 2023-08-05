part of 'upcoming_bloc.dart';

abstract class UpcomingEvent extends Equatable {
  const UpcomingEvent();
}

class FetchUpcoming extends UpcomingEvent {
  const FetchUpcoming();

  @override
  List<Object> get props => [];
}
