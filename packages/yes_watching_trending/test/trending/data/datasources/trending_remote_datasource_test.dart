import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yes_watching_core/yes_watching_core.dart';
import 'package:yes_watching_trending/trending/data/datasources/trending_remote_datasource.dart';
import 'package:yes_watching_trending/trending/data/models/trending_response_model.dart';

import 'trending_remote_datasource_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {
  late TrendingRemoteDatasource remoteDatasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDatasource = TrendingRemoteDatasourceImpl(client: mockHttpClient);
  });

  test('get trending all from api', () async {
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
    when(mockHttpClient.get(Uri.parse('$BASE_URL/trending/all/day?$API_KEY')))
        .thenAnswer((realInvocation) async {
      return http.Response(responseJson, 200,
          headers: {'content-type': 'application/json; charset=utf-8'});
    });
    final result = await remoteDatasource.getTrendingAll();
    expect(result, equals(trendingResponse));
  });
}
