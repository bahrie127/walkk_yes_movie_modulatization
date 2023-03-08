import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_kids_state.dart';

class TvSeriesKidsCubit extends Cubit<TvSeriesKidsState> {
  TvSeriesKidsCubit() : super(TvSeriesKidsInitial());
}
