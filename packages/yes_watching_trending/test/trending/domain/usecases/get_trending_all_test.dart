import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yes_watching_trending/trending/domain/entities/trending.dart';
import 'package:yes_watching_trending/trending/domain/repositories/trending_repository.dart';
import 'package:yes_watching_trending/trending/domain/usecases/get_trending_all.dart';


import 'get_trending_all_test.mocks.dart';

@GenerateMocks([TrendingRepository])
void main() {
  late GetTrendingAll usercase;
  late MockTrendingRepository repository;

  setUp(() {
    repository  = MockTrendingRepository();
    usercase =  GetTrendingAll(repository: repository);
  });

  final trendings = <Trending>[];

  test('get trending all usecase', () async {
    when(repository.getTrendingAll()).thenAnswer((realInvocation) async {
      return Right(trendings);
    });

    final result = await usercase.execute();

    expect(result, Right(trendings));
  });
}