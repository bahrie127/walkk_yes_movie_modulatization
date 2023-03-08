import 'package:flutter/material.dart';
import 'package:yes_watching_movie/movies/presentation/pages/movie_page.dart';
import 'package:yes_watching_trending/trending/presentation/pages/trending_page.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = <Widget>[
    const TrendingPage(),
    const MoviePage(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}