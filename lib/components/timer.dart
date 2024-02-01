import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mystarship/constants.dart';

class MainPainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  double aniValue;
  double pi = math.pi;
  final ValueNotifier<int> notifier;

  MainPainter(
      {required this.timeElapsed,
      required this.totalTime,
      required this.aniValue,
      required this.notifier})
      : super(repaint: notifier);
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(-120.0, 0) & const Size(240.0, 240.0);

    var paint = Paint()
      ..color = lightColor
      ..strokeWidth = 24
      ..style = PaintingStyle.stroke;

    double start = pi * 1.5;
    double end = (360 * (timeElapsed / totalTime)) * math.pi / 180 * aniValue;
    canvas.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lightColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    double outsideStart = size.width / 2;
    final Path path = Path()
      ..moveTo(outsideStart, 0)
      ..lineTo(outsideStart * 3, size.height / 2)
      ..lineTo(outsideStart, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
