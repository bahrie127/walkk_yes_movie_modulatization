import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_popular_movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetPopularMovie getPopularMovie;
  MoviesBloc(
    this.getPopularMovie,
  ) : super(MoviesInitial()) {
    on<GetPopularMovieEvent>((event, emit) async {
      emit(PopularMovieLoading());
      final result = await getPopularMovie.execute();
      result.fold(
        (error) => emit(PopularMovieFailed(message: error.message)),
        (data) => emit(PopularMovieLoaded(movies: data)),
      );
    });
  }
}
