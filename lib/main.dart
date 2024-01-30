import 'dart:math' as math;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Starship',
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: outlineColor)),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: secondaryColor,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Center(
                                  child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close Botoom Sheet'),
                                  ),
                                ],
                              )),
                            );
                          });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 48,
                        child: SvgPicture.asset("assets/icons/menu.svg")),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 48),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: darkOutineColor,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder<int>(
                          valueListenable: _counter,
                          builder: (context, value, child) {
                            return TweenAnimationBuilder(
                              duration: const Duration(seconds: 0),
                              tween: Tween(begin: 0.0, end: 1.0),
                              curve: Curves.easeOutCubic,
                              builder: (BuildContext context, dynamic value,
                                  Widget? child) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomPaint(
                                      painter: OpenPainter(
                                          timeElapsed: _counter.value,
                                          totalTime: 10,
                                          aniValue: value,
                                          notifier: _counter),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 240,
                                        width: 240,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2, color: outlineColor)),
                                        child: Text(
                                          "43:33",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(
                            height:
                                48), // Adjust the space between the two containers
                        GestureDetector(
                          onTapUp: (TapUpDetails details) {
                            if (_counter.value < 10) {
                              _counter.value++;
                            } else {
                              _counter.value = 0;
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.rectangle,
                                border:
                                    Border.all(width: 2, color: outlineColor),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text("Start",
                                style: TextStyle(
                                    fontSize: 24, color: outlineColor)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 48),
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage("assets/images/rocket.png"),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  int timeElapsed;
  int totalTime;
  final aniValue;
  double pi = math.pi;
  final ValueNotifier<int> notifier;

  OpenPainter(
      {required this.timeElapsed,
      required this.totalTime,
      this.aniValue,
      required this.notifier})
      : super(repaint: notifier);
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(-120.0, 0) & const Size(240.0, 240.0);

    var paint = Paint()
      ..color = outlineColor
      ..strokeWidth = 24
      ..style = PaintingStyle.stroke;

    double start = pi * 1.5;
    double end = (360 * (timeElapsed / totalTime)) * math.pi / 180 * aniValue;
    canvas.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
