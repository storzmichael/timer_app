import 'package:flutter/material.dart';
import 'package:timer_app/src/core/presentation/app_home.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int timerMilliSeconds = 0;
  bool isRunning = false;
  final TextEditingController _controller = TextEditingController();

  Future<void> runTime() async {
    while (isRunning && timerMilliSeconds > 0) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        timerMilliSeconds -= 100;
      });
    }
    if (timerMilliSeconds <= 0) {
      stopTimer();
      setState(() {
        scaffoldColor = Colors.green;
      });
    }
  }

  void startTimer() {
    if (!isRunning && timerMilliSeconds > 0) {
      setState(() {
        isRunning = true;
      });
      runTime();
    }
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
  }

  void clearTimer() {
    stopTimer();
    setState(() {
      timerMilliSeconds = 0;
      _controller.clear();
      scaffoldColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Eingabe in Sekunden',
            ),
            onChanged: (value) {
              setState(() {
                timerMilliSeconds = (int.tryParse(value) ?? 0) * 1000;
              });
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              '${(timerMilliSeconds / 1000)} s',
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: clearTimer,
                child: const Text('Reset'),
              ),
              const SizedBox(
                width: 40,
              ),
              isRunning
                  ? ElevatedButton(
                      onPressed: stopTimer,
                      child: const Text('Pause'),
                    )
                  : ElevatedButton(
                      onPressed: startTimer,
                      child: const Text('Start'),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
