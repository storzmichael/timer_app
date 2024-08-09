import 'package:flutter/material.dart';

class ScrollWheel extends StatelessWidget {
  final double width;
  final double height;

  const ScrollWheel({
    super.key,
    this.width = 300,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stunden-Rad
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                diameterRatio: 1.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  childCount: 24, // Stunden von 00 bis 23
                ),
              ),
            ),
            // Doppelpunkt Trennzeichen
            const SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  ':',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            // Minuten-Rad
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                diameterRatio: 1.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  childCount: 60, // Minuten von 00 bis 59
                ),
              ),
            ),
            // Doppelpunkt Trennzeichen
            const SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  ':',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            // Sekunden-Rad
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                diameterRatio: 1.5,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  childCount: 60, // Sekunden von 00 bis 59
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
