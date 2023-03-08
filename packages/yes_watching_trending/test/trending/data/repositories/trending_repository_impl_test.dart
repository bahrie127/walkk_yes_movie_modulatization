import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yes_watching_trending/trending/data/datasources/trending_remote_datasource.dart';
import 'package:yes_watching_trending/trending/data/models/trending_response_model.dart';
import 'package:yes_watching_trending/trending/data/repositories/trending_repository_impl.dart';


import 'trending_repository_impl_test.mocks.dart';

@GenerateMocks([TrendingRemoteDatasource])
void main() {
  late TrendingRepositoryImpl repository;
  late MockTrendingRemoteDatasource remoteDatasource;

  setUp(() {
    remoteDatasource = MockTrendingRemoteDatasource();
    repository = TrendingRepositoryImpl(remoteDatasource: remoteDatasource);
  });

  String responseJson = '''
    {
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/3zt7xPU8pn5wpc17OScVDrGgV5X.jpg",
                "id": 1429,
                "name": "Attack on Titan",
                "original_language": "ja",
                "original_name": "進撃の巨人",
                "overview": "Several hundred years ago, humans were nearly exterminated by Titans. Titans are typically several stories tall, seem to have no intelligence, devour human beings and, worst of all, seem to do it for the pleasure rather than as a food source. A small percentage of humanity survived by walling themselves in a city protected by extremely high walls, even taller than the biggest Titans. Flash forward to the present and the city has not seen a Titan in over 100 years. Teenage boy Eren and his foster sister Mikasa witness something horrific as the city walls are destroyed by a Colossal Titan that appears out of thin air. As the smaller Titans flood the city, the two kids watch in horror as their mother is eaten alive. Eren vows that he will murder every single Titan and take revenge for all of mankind.",
                "poster_path": "/aiy35Evcofzl7hASZZvsFgltHTX.jpg",
                "media_type": "tv",
                "genre_ids": [
                    10765,
                    16,
                    10759
                ],
                "popularity": 188.798,
                "first_air_date": "2013-04-07",
                "vote_average": 8.7,
                "vote_count": 4973,
                "origin_country": [
                    "JP"
                ]
            }
        ],
        "total_pages": 1000,
        "total_results": 20000
    }
    ''';

  final trendingResponse =
      TrendingResponseModel.fromJson(json.decode(responseJson));

  test('get trending all repository', () async {
    when(remoteDatasource.getTrendingAll()).thenAnswer((realInvocation) async {
      return trendingResponse;
    });
    final result = await repository.getTrendingAll();
    final resultList = result.getOrElse(() => []);
    expect(
      resultList,
      trendingResponse.results!
          .map(
            (e) => e.toEntity(),
          )
          .toList(),
    );
  });
}
