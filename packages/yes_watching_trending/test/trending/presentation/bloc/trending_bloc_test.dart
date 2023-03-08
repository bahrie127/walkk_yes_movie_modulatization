import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yes_watching_core/yes_watching_core.dart';
import 'package:yes_watching_trending/trending/domain/entities/trending.dart';
import 'package:yes_watching_trending/trending/domain/usecases/get_trending_all.dart';
import 'package:yes_watching_trending/trending/presentation/bloc/trending_bloc.dart';


import 'trending_bloc_test.mocks.dart';

@GenerateMocks([GetTrendingAll])
void main() {
  late TrendingBloc trendingBloc;
  late MockGetTrendingAll mockUsecase;

  setUp(() {
    mockUsecase = MockGetTrendingAll();
    trendingBloc = TrendingBloc(mockUsecase);
  });

  final trending = Trending(
    adult: false,
    backdropPath: 'backdropPath',
    id: 1,
    name: 'name',
    originalLanguage: 'EN',
    originalName: 'originalName',
    overview: 'overview',
    posterPath: 'posterPath',
    mediaType: 'MOVIE',
    genreIds: [1],
    popularity: 1.1,
    firstAirDate: DateTime(2022, 1, 1),
    voteAverage: 1.1,
    voteCount: 1,
    originCountry: ['JP'],
  );

  final trendingList = [trending];

  blocTest<TrendingBloc, TrendingState>(
    'should emit [loading, loaded] when get trending is successfully',
    build: () {
      when(mockUsecase.execute()).thenAnswer((realInvocation) async {
        return Right(trendingList);
      });
      return trendingBloc;
    },
    act: (bloc) => bloc.add(GetAllTrendingEvent()),
    expect: () => [TrendingLoading(), TrendingLoaded(trendings: trendingList)],
  );

  blocTest<TrendingBloc, TrendingState>(
    'should emit [loading, failed] when get trending response unsuccessful',
    build: () {
      when(mockUsecase.execute()).thenAnswer((realInvocation) async {
        return const Left(ServerFailure('server failure'));
      });
      return trendingBloc;
    },
    act: (bloc) => bloc.add(GetAllTrendingEvent()),
    expect: () => [
      TrendingLoading(),
      const TrendingFailed(message: 'server failure'),
    ],
  );

  blocTest<TrendingBloc, TrendingState>(
    'should emit [loading, failed] when get trending common failure',
    build: () {
      when(mockUsecase.execute()).thenAnswer((realInvocation) async {
        return const Left(CommonFailure('common failure'));
      });
      return trendingBloc;
    },
    act: (bloc) => bloc.add(GetAllTrendingEvent()),
    expect: () => [
      TrendingLoading(),
      const TrendingFailed(message: 'common failure'),
    ],
  );
}
