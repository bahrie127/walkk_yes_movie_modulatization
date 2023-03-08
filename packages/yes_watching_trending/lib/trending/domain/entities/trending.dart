import 'package:flutter/foundation.dart';

class Trending {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
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
  Trending({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trending &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.id == id &&
        other.name == name &&
        other.originalLanguage == originalLanguage &&
        other.originalName == originalName &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.mediaType == mediaType &&
        listEquals(other.genreIds, genreIds) &&
        other.popularity == popularity &&
        other.firstAirDate == firstAirDate &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount &&
        listEquals(other.originCountry, originCountry) &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.releaseDate == releaseDate &&
        other.video == video;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        id.hashCode ^
        name.hashCode ^
        originalLanguage.hashCode ^
        originalName.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        mediaType.hashCode ^
        genreIds.hashCode ^
        popularity.hashCode ^
        firstAirDate.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode ^
        originCountry.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        releaseDate.hashCode ^
        video.hashCode;
  }
}
