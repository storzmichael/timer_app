import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  int totalMilliSeconds = 0;
  bool isRunning = false;

  runTime() async {
    while (isRunning) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        totalMilliSeconds += 100;
      });
    }
  }

  startWatch() {
    if (!isRunning) {
      isRunning = true;
      runTime();
    }
  }

  stopWatch() {
    isRunning = false;
  }

  clearWatch() {
    stopWatch();
    setState(() {
      totalMilliSeconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${totalMilliSeconds / 1000} s',
            style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: clearWatch, child: const Text('Clear')),
              const SizedBox(
                width: 40,
              ),
              isRunning
                  ? ElevatedButton(onPressed: stopWatch, child: const Text('Stop'))
                  : ElevatedButton(onPressed: startWatch, child: const Text('Start')),
            ],
          )
        ],
      ),
    );
  }
}
