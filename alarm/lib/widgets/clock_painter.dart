import 'dart:math';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final hourTickPaint = Paint()
      ..color = const Color(0x91a6b4c8)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    // Draw clock ticks (indicators)
    for (int i = 0; i < 12; i++) {
      final tickLength = 10.0; // Longer ticks for hours
      final angle = 2 * pi * i / 12;

      final tickStart = Offset(
        center.dx + radius * 0.85 * cos(angle),
        center.dy + radius * 0.85 * sin(angle),
      );
      final tickEnd = Offset(
        center.dx + (radius * 0.85 - tickLength) * cos(angle),
        center.dy + (radius * 0.85 - tickLength) * sin(angle),
      );

      canvas.drawLine(tickStart, tickEnd, hourTickPaint);
    }

    final now = DateTime.now();

    // Draw hour hand
    final hourAngle = 2 * pi * ((now.hour % 12) + now.minute / 60) / 12;
    final hourHand = Offset(
      center.dx + radius * 0.45 * cos(hourAngle - pi / 2),
      center.dy + radius * 0.45 * sin(hourAngle - pi / 2),
    );
    final start_hour = Offset(
      center.dx + radius * -0.22 * cos(hourAngle - pi / 2),
      center.dy + radius * -0.22 * sin(hourAngle - pi / 2),
    );
    final hourPaint = Paint()
      ..color = const Color(0xff646E82)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start_hour, hourHand, hourPaint);

    // Draw minute hand
    final minuteAngle = 2 * pi * (now.minute) / 60;
    final minuteHand = Offset(
      center.dx + radius * 0.65 * cos(minuteAngle - pi / 2),
      center.dy + radius * 0.65 * sin(minuteAngle - pi / 2),
    );
    final start_min = Offset(
      center.dx + radius * -0.25 * cos(minuteAngle - pi / 2),
      center.dy + radius * -0.25 * sin(minuteAngle - pi / 2),
    );
    final minutePaint = Paint()
      ..color = const Color(0xff646E82)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start_min, minuteHand, minutePaint);
    final centerDot = Paint()
      ..color = const Color(0xff646E82)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 7, centerDot);
    // Draw second hand
    final secondAngle = 2 * pi * (now.second) / 60;
    final secondHand = Offset(
      center.dx + radius * 0.71 * cos(secondAngle - pi / 2),
      center.dy + radius * 0.71 * sin(secondAngle - pi / 2),
    );
    final start_sec = Offset(
      center.dx + radius * -0.3 * cos(secondAngle - pi / 2),
      center.dy + radius * -0.3 * sin(secondAngle - pi / 2),
    );
    final secondPaint = Paint()
      ..shader = const LinearGradient(colors: [Color(0xffFE725C), Color(0xfffd251e)]).createShader(Rect.fromPoints(start_sec, secondHand))
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start_sec, secondHand, secondPaint);

    final second = Offset(
      center.dx + radius * -0.11 * cos(secondAngle - pi / 2),
      center.dy + radius * -0.11 * sin(secondAngle - pi / 2),
    );
    final start = Offset(
      center.dx + radius * -0.3 * cos(secondAngle - pi / 2),
      center.dy + radius * -0.3 * sin(secondAngle - pi / 2),
    );
    secondPaint.strokeWidth = 5;
    canvas.drawLine(start, second, secondPaint);
    // Draw center dot
    centerDot.color = const Color(0xfffd251e);
    canvas.drawCircle(center, 5, centerDot);

  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}