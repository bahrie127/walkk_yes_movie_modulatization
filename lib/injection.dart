import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:yes_watching_movie/movies/data/datasources/movie_remote_datasource.dart';
import 'package:yes_watching_movie/movies/data/repositories/movie_repository_impl.dart';
import 'package:yes_watching_movie/movies/domain/repositories/movie_repository.dart';
import 'package:yes_watching_movie/movies/domain/usecases/get_popular_movie.dart';
import 'package:yes_watching_movie/movies/presentation/bloc/movies_bloc.dart';
import 'package:yes_watching_trending/trending/data/datasources/trending_remote_datasource.dart';
import 'package:yes_watching_trending/trending/data/repositories/trending_repository_impl.dart';
import 'package:yes_watching_trending/trending/domain/repositories/trending_repository.dart';
import 'package:yes_watching_trending/trending/domain/usecases/get_trending_all.dart';
import 'package:yes_watching_trending/trending/presentation/bloc/trending_bloc.dart';




final locator = GetIt.instance;

void init() {
  //bloc

  locator.registerFactory(() => TrendingBloc(locator()));
  locator.registerFactory(() => MoviesBloc(locator()));

  // use case

  locator.registerLazySingleton(() => GetTrendingAll(repository: locator()));
  locator.registerLazySingleton(() => GetPopularMovie(repository: locator()));

  // repository

  locator.registerLazySingleton<TrendingRepository>(
      () => TrendingRepositoryImpl(remoteDatasource: locator()));

  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDatasource: locator()));

  // data sources

  locator.registerLazySingleton<TrendingRemoteDatasource>(
      () => TrendingRemoteDatasourceImpl(client: locator()));

  locator.registerLazySingleton<MovieRemoteDatasource>(
      () => MovieRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
