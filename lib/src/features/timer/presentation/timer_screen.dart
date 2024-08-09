import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      setState(() {});
      stopTimer();
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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
              labelText: 'Eingabe in Sekunden',
              labelStyle: TextStyle(color: Colors.amber),
              filled: true,
              fillColor: Colors.black,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2.0),
              ),
            ),
            style: const TextStyle(color: Colors.white),
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
                  ? ElevatedButton(onPressed: stopTimer, child: const Text('Pause'))
                  : ElevatedButton(onPressed: startTimer, child: const Text('Start')),
            ],
          ),
        ],
      ),
    );
  }
}
