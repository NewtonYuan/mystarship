import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mystarship/constants.dart';

class MainPainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  double aniValue;
  double pi = math.pi;

  MainPainter(
      {required this.timeElapsed,
      required this.totalTime,
      required this.aniValue});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(-125.0, 0) & const Size(250.0, 250.0);

    var paint = Paint()
      ..color = lightColor
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double start = pi * 1.5;
    double end = (360 * (timeElapsed / totalTime)) * pi / 180;

    // Draw the main arc
    canvas.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//Maybe for future
/*Explanation:

A ball that rolls in an arc identical to the Timer's MainPainter.
This ball will roll once every 5s/10s and create an visual effect that makes the user feel like
time is moving. Kind of similar to charging up a railgun, where particles slowly gather at the 
tip. 

Priority: Low */
class CirclePainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  double aniValue;
  double pi = math.pi;

  CirclePainter(
      {required this.timeElapsed,
      required this.totalTime,
      required this.aniValue});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = 125;
    double radius = 125.0; // Same as the arc radius

    // Calculate the angle for the circle based on timeElapsed, totalTime, and aniValue
    double angle = (360 * (timeElapsed / totalTime)) * pi / 180 * aniValue;

    // Calculate the position of the circle
    double circleX = centerX + radius * math.cos(angle - pi / 2);
    double circleY = centerY + radius * math.sin(angle - pi / 2);

    var paint = Paint()
      ..color = Colors.blue // Set the color of the circle
      ..strokeWidth = 6
      ..style = PaintingStyle.fill; // Use fill style to draw a filled circle

    // Draw the circle at the calculated position
    canvas.drawCircle(Offset(circleX, circleY), 6, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
