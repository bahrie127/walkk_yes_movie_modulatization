import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yes_watching_movie/movies/data/datasources/movie_remote_datasource.dart';
import 'package:yes_watching_movie/movies/data/models/movie_response_model.dart';
import 'package:yes_watching_movie/movies/data/repositories/movie_repository_impl.dart';
import 'package:yes_watching_movie/movies/domain/repositories/movie_repository.dart';


import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieRemoteDatasource])
void main() {
  late MovieRepository repository;
  late MockMovieRemoteDatasource mockMovieRemoteDatasource;

  setUp(() {
    mockMovieRemoteDatasource = MockMovieRemoteDatasource();
    repository =
        MovieRepositoryImpl(remoteDatasource: mockMovieRemoteDatasource);
  });

  String responseString = '''
  {
    "page": 3,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/jDkmlTz9xBmhsIIyORb68VqRlL2.jpg",
            "genre_ids": [
                27
            ],
            "id": 955991,
            "original_language": "en",
            "original_title": "The Offering",
            "overview": "In ",
            "popularity": 518.625,
            "poster_path": "/tbaTFgGIaTL1Uhd0SMob6Dhi5cK.jpg",
            "release_date": "2022-09-23",
            "title": "The Offering",
            "video": false,
            "vote_average": 5.8,
            "vote_count": 95
        }
    ],
    "total_pages": 37337,
    "total_results": 746723
}
''';

  final responseModel =
      MovieResponseModel.fromJson(json.decode(responseString));

  test(
    'repository get popular movie',
    () async {
      //arrange
      when(mockMovieRemoteDatasource.getPopularMovie())
          .thenAnswer((realInvocation) async {
        return responseModel;
      });

      //act
      final result = await repository.getPopularMovie();
      final resultList = result.getOrElse(() => []);
      //assert
      expect(
        resultList,
        responseModel.results!
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
      );
    },
  );
}
