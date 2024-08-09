import 'package:flutter/material.dart';

class SimpleTimer extends StatefulWidget {
  const SimpleTimer({super.key});

  @override
  State<SimpleTimer> createState() => _SimpleTimerState();
}

class _SimpleTimerState extends State<SimpleTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: const Center(
        child: Text(
          '00 : 00 : 00',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
