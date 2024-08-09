import 'package:flutter/material.dart';

import 'package:timer_app/src/features/stopwatch/presentation/stopwatch_screen.dart';
import 'package:timer_app/src/features/timer/presentation/timer_screen.dart';

class AppHome extends StatefulWidget {
  static const routeName = '/';
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  } //List of screen from navigation bar

  final List<Widget> screens = [
    const StopwatchScreen(),
    const TimerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.watch,
              color: Colors.white,
            ),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.watch_later_outlined,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.watch_later_outlined,
              color: Colors.white,
            ),
            label: 'Timer',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
