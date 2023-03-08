part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();

  @override
  List<Object> get props => [];
}

class GetAllTrendingEvent extends TrendingEvent{}


