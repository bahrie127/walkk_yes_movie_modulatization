// To parse this JSON data, do
//
//     final trendingResponseModel = trendingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/trending.dart';


class TrendingResponseModel extends Equatable {
  TrendingResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<TrendingResponse>? results;
  int? totalPages;
  int? totalResults;

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];

  factory TrendingResponseModel.fromRawJson(String str) =>
      TrendingResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrendingResponseModel.fromJson(Map<String, dynamic> json) =>
      TrendingResponseModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<TrendingResponse>.from(
                json["results"]!.map((x) => TrendingResponse.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TrendingResponse extends Equatable {
  TrendingResponse({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
  });

  Trending toEntity() {
    return Trending(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      name: name,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType!.name,
      genreIds: genreIds,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      originCountry: originCountry,
      title: title,
      originalTitle: originalTitle,
      releaseDate: releaseDate,
      video: video,
    );
  }

  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  MediaType? mediaType;
  List<int>? genreIds;
  double? popularity;
  DateTime? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;
  String? title;
  String? originalTitle;
  DateTime? releaseDate;
  bool? video;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        originCountry,
        title,
        originalTitle,
        releaseDate,
        video,
      ];

  factory TrendingResponse.fromRawJson(String str) =>
      TrendingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      TrendingResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        title: json["title"],
        originalTitle: json["original_title"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "title": title,
        "original_title": originalTitle,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
      };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
