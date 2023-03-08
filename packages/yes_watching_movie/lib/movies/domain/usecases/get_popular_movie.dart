import 'package:dartz/dartz.dart';

import 'package:yes_watching_core/yes_watching_core.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovie {
  final MovieRepository repository;
  GetPopularMovie({
    required this.repository,
  });

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovie();
  }
}
