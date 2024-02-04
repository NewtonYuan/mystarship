import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mystarship/constants.dart';

class MainPainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  double aniValue;
  double pi = math.pi;
  final ValueNotifier<int> notifier;

  MainPainter({
    required this.timeElapsed,
    required this.totalTime,
    required this.aniValue,
    required this.notifier,
  }) : super(repaint: notifier);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(-125.0, 0) & const Size(250.0, 250.0);

    var paint = Paint()
      ..color = lightColor
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double start = pi * 1.5;
    double end = (360 * (timeElapsed / totalTime)) * pi / 180 * aniValue;

    // Draw the main arc
    canvas.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  double aniValue;
  double pi = math.pi;
  final ValueNotifier<int> notifier;

  CirclePainter({
    required this.timeElapsed,
    required this.totalTime,
    required this.aniValue,
    required this.notifier,
  }) : super(repaint: notifier);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(-125.0, 0) & const Size(250.0, 250.0);

    var paint = Paint()
      ..color = lightColor
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double start = pi * 1.5;
    double end = (360 * (timeElapsed / totalTime)) * pi / 180 * aniValue;

    // Draw the main arc
    canvas.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
