import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yes_watching_trending/trending/domain/entities/trending.dart';
import 'package:yes_watching_trending/trending/presentation/widgets/trending_item_widget.dart';

void main() {
  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
    );
  }

  final trending = Trending(
    adult: false,
    backdropPath: '/backdropPath.jpg',
    id: 1,
    name: 'Upin Ipin',
    originalLanguage: 'EN',
    originalName: 'originalName',
    overview: 'overview',
    posterPath: '/posterPath.jpg',
    mediaType: 'MOVIE',
    genreIds: [1],
    popularity: 1.1,
    firstAirDate: DateTime(2022, 1, 1),
    voteAverage: 1.1,
    voteCount: 1,
    originCountry: ['JP'],
  );

  testWidgets('should display trending info with currect data',
      (widgetTester) async {
    await widgetTester
        .pumpWidget(makeTestableWidget(TrendingItemWidget(item: trending)));
    final widgetInkWell = find.byType(InkWell);
    final trendingImage = find.byType(CachedNetworkImage);
    final trendingImageValue =
        widgetTester.widget<CachedNetworkImage>(trendingImage);

    final inkwellData = widgetTester.widget<InkWell>(widgetInkWell);
    expect(inkwellData.onTap, isNotNull);

    expect(widgetInkWell, findsOneWidget);
    expect(find.text(trending.name!), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);

    expect(trendingImageValue.imageUrl,
        equals('https://image.tmdb.org/t/p/w500${trending.posterPath}'));
  });
}
