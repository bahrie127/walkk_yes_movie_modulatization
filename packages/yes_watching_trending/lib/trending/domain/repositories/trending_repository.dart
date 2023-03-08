import 'package:dartz/dartz.dart';
import 'package:yes_watching_core/yes_watching_core.dart';


import '../entities/trending.dart';

abstract class TrendingRepository {
  Future<Either<Failure, List<Trending>>> getTrendingAll();
}
