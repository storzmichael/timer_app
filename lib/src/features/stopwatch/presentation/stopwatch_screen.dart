import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  bool isTimerRunning = false;
  static const double widthText = 90.0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 30), (_) async {
      await updateTime();
    });
  }

  Future<void> updateTime() async {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  void startStopwatch() async {
    if (!isTimerRunning) {
      stopwatch.start();
      setState(() {
        isTimerRunning = true;
      });
    } else {
      stopwatch.stop();
      setState(() {
        isTimerRunning = false;
      });
    }
  }

  void resetStopwatch() {
    stopwatch.reset();
    stopwatch.stop();
    setState(() {
      isTimerRunning = false;
    });
  }

  String formatTimeSegment(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = stopwatch.elapsed;
    final minutes = formatTimeSegment(elapsed.inMinutes.remainder(60));
    final seconds = formatTimeSegment(elapsed.inSeconds.remainder(60));
    final milliseconds = formatTimeSegment(elapsed.inMilliseconds.remainder(1000) ~/ 10);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Stopuhr',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 64),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widthText,
                  child: Text(
                    minutes,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  ' : ',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: widthText,
                  child: Text(
                    seconds,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  ' : ',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: widthText,
                  child: Text(
                    milliseconds,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: startStopwatch,
                child: Text(isTimerRunning ? 'Pause' : 'Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: resetStopwatch,
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
