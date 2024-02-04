import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/components/home_menu.dart';
import 'package:mystarship/components/timer.dart';
import 'package:mystarship/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
              Theme.of(context).textTheme.apply(displayColor: lightColor)),
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
  int _timeCounter = 0;
  int totalTime = 90;
  int hours = 0;
  late Timer _timer = Timer(Duration.zero, () {});
  bool isPressed = false;

  @override
  void initState() {
    hours = ((totalTime - _timeCounter) ~/ 3600);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeCounter++;
        hours = ((totalTime - _timeCounter) ~/ 3600);
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

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
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      isPressed = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      isPressed = false;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      isPressed = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: isPressed
                          ? lightColor
                          : primaryColor, // Change to your primaryColor
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 2,
                          color: lightColor), // Change to your lightColor
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 24,
                        color: isPressed
                            ? primaryColor
                            : lightColor, // Change to your lightColor
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: secondaryColor,
                          context: context,
                          builder: (BuildContext context) {
                            return const HomeMenu();
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomPaint(
                                      painter: MainPainter(
                                          timeElapsed: _timeCounter,
                                          totalTime: totalTime,
                                          aniValue: value,
                                          notifier: _counter),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 240,
                                        width: 240,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2, color: lightColor)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Visibility(
                                                  visible: hours > 0,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      Text(
                                                        '${(totalTime - _timeCounter) ~/ 3600}',
                                                        style: const TextStyle(
                                                            fontSize: 72,
                                                            color: lightColor),
                                                      ),
                                                      const Text(
                                                        'h',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            color: lightColor),
                                                      ),
                                                    ],
                                                  )),
                                              Text(
                                                ((totalTime - _timeCounter)
                                                            .remainder(3600) ~/
                                                        60)
                                                    .toString()
                                                    .padLeft(2, '0'),
                                                style: TextStyle(
                                                    fontSize:
                                                        (hours <= 0 ? 64 : 56),
                                                    color: lightColor),
                                              ),
                                              const Text(
                                                'm',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              ),
                                              Text(
                                                (totalTime - _timeCounter)
                                                    .remainder(60)
                                                    .toString()
                                                    .padLeft(2, '0'),
                                                style: TextStyle(
                                                    fontSize:
                                                        (hours <= 0 ? 32 : 24),
                                                    color: lightColor),
                                              ),
                                              const Text(
                                                's',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lightColor),
                                              ),
                                            ]))
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 48),
                        GestureDetector(
                          onTapUp: (TapUpDetails details) {
                            if (_timer.isActive) {
                              stopTimer();
                              _timeCounter = 0;
                            } else {
                              startTimer();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(width: 2, color: lightColor),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text("Start",
                                style:
                                    TextStyle(fontSize: 24, color: lightColor)),
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
