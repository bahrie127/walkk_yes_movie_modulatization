import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_watching_core/yes_watching_core.dart';


import '../bloc/movies_bloc.dart';
import '../widgets/movie_item_widget.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Movie Everyday'),
      ),
      body: SafeArea(
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is PopularMovieLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return MovieItemWidget(item: state.movies[index]);
                },
                itemCount: state.movies.length,
              );
            }
            if (state is PopularMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PopularMovieFailed) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
      bottomNavigationBar: const WatchBottomNavbar(
        index: 1,
      ),
    );
  }
}
