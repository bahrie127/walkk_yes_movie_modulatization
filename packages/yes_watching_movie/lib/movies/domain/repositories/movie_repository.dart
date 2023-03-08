import 'package:dartz/dartz.dart';
import 'package:yes_watching_core/yes_watching_core.dart';

import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovie();
}
