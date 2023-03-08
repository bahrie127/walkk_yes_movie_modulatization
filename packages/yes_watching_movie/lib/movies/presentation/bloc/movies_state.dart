part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class PopularMovieLoading extends MoviesState {}

class PopularMovieLoaded extends MoviesState {
  final List<Movie> movies;
  const PopularMovieLoaded({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class PopularMovieFailed extends MoviesState {
  final String message;
  const PopularMovieFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
