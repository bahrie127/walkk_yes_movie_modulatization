import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yes_watching_core/yes_watching_core.dart';

import '../models/movie_response_model.dart';

abstract class MovieRemoteDatasource {
  Future<MovieResponseModel> getPopularMovie();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDatasource {
  final http.Client client;
  MovieRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<MovieResponseModel> getPopularMovie() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));
    return MovieResponseModel.fromJson(json.decode(response.body));
  }
}
