import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/trending.dart';
import '../../domain/usecases/get_trending_all.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingAll usecase;
  TrendingBloc(
    this.usecase,
  ) : super(TrendingInitial()) {
    on<GetAllTrendingEvent>((event, emit) async {
      emit(TrendingLoading());
      final result = await usecase.execute();
      result.fold(
        (error) => emit(TrendingFailed(message: error.message)),
        (data) => emit(TrendingLoaded(trendings: data)),
      );
    });
  }
}
