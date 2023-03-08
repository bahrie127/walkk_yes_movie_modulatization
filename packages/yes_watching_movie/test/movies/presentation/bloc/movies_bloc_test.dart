import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:yes_watching_movie/movies/domain/entities/movie.dart';
import 'package:yes_watching_movie/movies/domain/usecases/get_popular_movie.dart';
import 'package:yes_watching_movie/movies/presentation/bloc/movies_bloc.dart';
import 'movies_bloc_test.mocks.dart';

@GenerateMocks([GetPopularMovie])
void main() {
  late MoviesBloc moviesBloc;
  late MockGetPopularMovie usecase;

  setUp(() {
    usecase = MockGetPopularMovie();
    moviesBloc = MoviesBloc(usecase);
  });

  blocTest<MoviesBloc, MoviesState>(
    'emits [loading, loaded] when get popular movie successfully.',
    build: () {
      when(usecase.execute()).thenAnswer((realInvocation) async {
        return const Right(<Movie>[]);
      });
      return moviesBloc;
    },
    act: (bloc) => bloc.add(GetPopularMovieEvent()),
    expect: () => [
      PopularMovieLoading(),
      const PopularMovieLoaded(movies: <Movie>[]),
    ],
  );
}
