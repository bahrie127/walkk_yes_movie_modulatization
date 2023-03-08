import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_watching_movie/movies/presentation/bloc/movies_bloc.dart';
import 'package:yes_watching_trending/trending/presentation/bloc/trending_bloc.dart';
import 'package:yes_watching_trending/trending/presentation/pages/trending_page.dart';



import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                di.locator<TrendingBloc>()..add(GetAllTrendingEvent()),
          ),
          BlocProvider(
            create: (context) =>
                di.locator<MoviesBloc>()..add(GetPopularMovieEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TrendingPage(),
        ));

    ;
  }
}
