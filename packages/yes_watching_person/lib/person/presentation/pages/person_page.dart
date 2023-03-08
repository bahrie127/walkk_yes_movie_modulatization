import 'package:flutter/material.dart';
import 'package:yes_watching_core/yes_watching_core.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Page'),
      ),
      body: const Center(
        child: Text('Person Page'),
      ),
      bottomNavigationBar: const WatchBottomNavbar(index: 3),
    );
  }
}
