import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yes_watching_movie/movies/domain/entities/movie.dart';
import 'package:yes_watching_movie/movies/domain/repositories/movie_repository.dart';
import 'package:yes_watching_movie/movies/domain/usecases/get_popular_movie.dart';


import 'get_popular_movie_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late GetPopularMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMovie(repository: mockMovieRepository);
  });

  final listMovie = <Movie>[];

  test('use case get popular movie', () async {
    //arrange
    when(mockMovieRepository.getPopularMovie())
        .thenAnswer((realInvocation) async {
      return Right(listMovie);
    });
    //act
    final result = await usecase.execute();
    //assert
    expect(result, Right(listMovie));
  });
}
