import 'package:dartz/dartz.dart';
import 'package:yes_watching_core/yes_watching_core.dart';

import '../../domain/entities/trending.dart';
import '../../domain/repositories/trending_repository.dart';
import '../datasources/trending_remote_datasource.dart';



class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingRemoteDatasource remoteDatasource;
  TrendingRepositoryImpl({
    required this.remoteDatasource,
  });
  @override
  Future<Either<Failure, List<Trending>>> getTrendingAll() async {
    try {
      final result = await remoteDatasource.getTrendingAll();
      return Right(result.results!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
