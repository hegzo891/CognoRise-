import 'dart:async'; // Import Timer
import 'package:flutter/material.dart';
import 'clock_painter.dart';

class AnalogWatch extends StatefulWidget {
  const AnalogWatch({super.key});

  @override
  State<AnalogWatch> createState() => _AnalogWatchState();
}

class _AnalogWatchState extends State<AnalogWatch> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up the timer to trigger every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // This will rebuild the widget every second
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffE6E9EF),
            Color(0xffEEF0F5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          // Outer Shadow (soft outer glow)
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 20,
            offset: const Offset(10, 10), // Shadows to the right and below
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            spreadRadius: -4,
            blurRadius: 20,
            offset: const Offset(-10, -10), // Shadows to the left and above
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2 + 10,
          height: MediaQuery.sizeOf(context).width / 2 + 10,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xffE6E9EF), Color(0xffEEF0F5), ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              // Inner Shadow (light source effect)
              BoxShadow(
                offset: const Offset(-12, -12),
                spreadRadius: 0,
                blurRadius: 20,
                color: const Color(0x33ffffff),
              ),
              BoxShadow(
                offset: const Offset(12, 12),
                spreadRadius: 0,
                blurRadius: 20,
                color: const Color(0x22000000),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffa5b1c3),
                    Color(0xfffefeff),
                  ],begin: Alignment.topLeft,
                    end: Alignment.bottomRight,),
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xffbec7d6), Color(0xfffafbfd)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CustomPaint(
                    painter: ClockPainter(), // Rebuilds every second
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
