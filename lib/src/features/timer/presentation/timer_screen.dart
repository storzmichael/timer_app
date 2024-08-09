import 'package:flutter/material.dart';
import 'package:timer_app/src/features/timer/presentation/scroll_wheel.dart';
import 'package:timer_app/src/features/timer/presentation/wheel_timer.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool isTimerRun = false;

  Future<void> fetchTimer() async {
    Future.delayed(const Duration(seconds: 3));
  }

  void setTimer() async {
    setState(() {
      isTimerRun = true;
    });
    await fetchTimer();
    setState(() {
      isTimerRun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Timer',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: isTimerRun ? const SimpleTimer() : const ScrollWheel(),
          ),
          const SizedBox(
            height: 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Reset'),
              ),
              SizedBox(
                width: 40,
              ),
              isTimerRun
                  ? ElevatedButton(
                      onPressed: setTimer,
                      child: const Text('Pause'),
                    )
                  : ElevatedButton(
                      onPressed: setTimer,
                      child: const Text('Start'),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
