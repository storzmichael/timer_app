import 'package:flutter/material.dart';
import 'package:timer_app/src/features/example/presentation/example_stopwatch.dart';
import 'package:timer_app/src/features/stopwatch/presentation/stopwatch_screen.dart';
import 'package:timer_app/src/features/timer/presentation/timer_screen.dart';

Color scaffoldColor = Colors.black;

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const StopwatchScreen(),
    const TimerScreen(),
    const ExampleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: scaffoldColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Stopwatch 2',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
