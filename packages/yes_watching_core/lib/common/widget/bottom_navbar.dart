import 'package:flutter/material.dart';



import 'package:yes_watching_movie/movies/presentation/pages/movie_page.dart';
import 'package:yes_watching_person/person/presentation/pages/person_page.dart';
import 'package:yes_watching_trending/trending/presentation/pages/trending_page.dart';

import 'package:yes_watching_tv_series/features/tv_series/presentation/pages/tv_series_page.dart';


import '../constants.dart';

class WatchBottomNavbar extends StatefulWidget {
  const WatchBottomNavbar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<WatchBottomNavbar> createState() => _WatchBottomNavbarState();
}

class _WatchBottomNavbarState extends State<WatchBottomNavbar> {
  @override
  void initState() {
    _selectIndex = widget.index;
    super.initState();
  }

  int _selectIndex = 0;
  void handlerSelected(int index) {
    _selectIndex = index;
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const TrendingPage();
      }));
    }

    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MoviePage();
      }));
    }
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const TvSeriesPage();
      }));
    }
    if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PersonPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _selectIndex,
      unselectedItemColor: Colors.black,
      selectedItemColor: titleColor,
      iconSize: 24,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      onTap: handlerSelected,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home_filled,
            color: titleColor,
          ),
          icon: Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
          label: 'Tranding',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.movie_creation_outlined,
            color: titleColor,
          ),
          icon: Icon(
            Icons.movie_creation_outlined,
            color: Colors.black,
          ),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.tv_outlined,
            color: titleColor,
          ),
          icon: Icon(
            Icons.tv_outlined,
            color: Colors.black,
          ),
          label: 'TV Series',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.person_3_outlined,
            color: titleColor,
          ),
          icon: Icon(
            Icons.person_3_outlined,
            color: Colors.black,
          ),
          label: 'Person',
        ),
      ],
    );
  }
}
