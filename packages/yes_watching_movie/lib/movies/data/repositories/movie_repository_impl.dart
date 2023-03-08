import 'package:dartz/dartz.dart';

import 'package:yes_watching_core/yes_watching_core.dart';


import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;
  MovieRepositoryImpl({
    required this.remoteDatasource,
  });
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie()async{
    try{
      final result = await remoteDatasource.getPopularMovie();
      return Right(result.results!.map((e) => e.toEntity()).toList());
    }catch (e){
      return const Left(ServerFailure('server error'));
    }

  }

}
