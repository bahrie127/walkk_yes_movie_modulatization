import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yes_watching_core/yes_watching_core.dart';
import 'package:yes_watching_movie/movies/data/datasources/movie_remote_datasource.dart';
import 'package:yes_watching_movie/movies/data/models/movie_response_model.dart';

import 'movie_remote_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late MovieRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
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

  test('test get movie popular from api', () async {
    when(mockHttpClient.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY')))
        .thenAnswer((realInvocation) async {
      return http.Response(
        responseString,
        200,
        // headers: {'content-type': 'application/json; charset=utf-8'},
      );
    });

    //act
    final result = await remoteDataSource.getPopularMovie();
    //assert
    expect(result, equals(responseModel));
  });
}
