import 'package:flutter/material.dart';
import 'package:yes_watching_core/yes_watching_core.dart';

class TvSeriesPage extends StatefulWidget {
  const TvSeriesPage({super.key});

  @override
  State<TvSeriesPage> createState() => _TvSeriesPageState();
}

class _TvSeriesPageState extends State<TvSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Series'),
      ),
      body: const Center(
        child: Text('TV SERIES'),
      ),
      bottomNavigationBar: const WatchBottomNavbar(index: 2),
    );
  }
}
