import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  // Erzeugt ein `Stopwatch`-Objekt, um die verstrichene Zeit zu messen.
  final Stopwatch stopwatch = Stopwatch();

  // Deklariert eine Variable vom Typ `Timer`, die später initialisiert wird.
  // Der `Timer` wird verwendet, um die UI regelmäßig zu aktualisieren,
  // solange die Stoppuhr läuft.
  late Timer timer;

  // Gibt an, ob die Stoppuhr aktuell läuft oder nicht.
  bool isTimerRunning = false;

  // Definiert die Breite der Textfelder, in denen die Zeitsegmente
  // (Minuten, Sekunden, Millisekunden) angezeigt werden.
  final double widthText = 70.0;

  @override
  void initState() {
    super.initState();
    // Initialisiert den `Timer`, der alle 30 Millisekunden die `updateTime()`-Methode
    // aufruft. Dies sorgt dafür, dass die verstrichene Zeit in der UI regelmäßig
    // aktualisiert wird. '(_)' Platzhalter für das Argument, dies wird hier nicht
    // benötigt.
    timer = Timer.periodic(const Duration(milliseconds: 30), (_) async {
      await updateTime();
    });
  }

  // Diese Methode wird verwendet, um die UI zu aktualisieren, wenn die Stoppuhr läuft.
  // Wenn die Stoppuhr läuft (`stopwatch.isRunning` ist `true`), wird `setState()`
  // aufgerufen, um die UI neu zu rendern und die aktuelle Zeit anzuzeigen.
  Future<void> updateTime() async {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  // Diese Methode startet oder stoppt die Stoppuhr basierend auf ihrem aktuellen Zustand.
  // Wenn die Stoppuhr nicht läuft, wird sie gestartet und `isTimerRunning` wird auf
  //`true` gesetzt.
  // Wenn die Stoppuhr läuft, wird sie gestoppt und `isTimerRunning` wird auf `false`
  // gesetzt.
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

  // Diese Methode setzt die Stoppuhr zurück und stoppt sie.
  // Dadurch wird die verstrichene Zeit auf null gesetzt und `isTimerRunning`
  // wird auf `false` gesetzt.
  void resetStopwatch() {
    stopwatch.reset();
    stopwatch.stop();
    setState(() {
      isTimerRunning = false;
    });
  }

  // Diese Hilfsmethode formatiert die Zeitsegmente (Minuten, Sekunden, Millisekunden),
  // indem sie sicherstellt, dass jedes Segment immer zwei Stellen hat.
  // Beispielsweise wird `5` zu `05` formatiert.
  String formatTime(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    // Berechnet die verstrichene Zeit seit dem Start der Stoppuhr.
    final elapsed = stopwatch.elapsed;

    // Formatiert die Minuten, Sekunden und Millisekunden für die Anzeige.
    final minutes = formatTime(elapsed.inMinutes.remainder(60));
    final seconds = formatTime(elapsed.inSeconds.remainder(60));
    final milliseconds = formatTime(elapsed.inMilliseconds.remainder(1000) ~/ 10);

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
