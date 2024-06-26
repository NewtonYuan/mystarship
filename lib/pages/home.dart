import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/components/animated_button.dart';
import 'package:mystarship/components/home_menu.dart';
import 'package:mystarship/components/timer.dart';
import 'package:mystarship/tools/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Home State
class _HomeState extends State<Home> {
  // Time counter for timer/stopwatch
  int _timeCounter = 0;
  // Initial total time for timer (30min)
  int totalTime = 5;
  // Hour count for UI
  int hours = 0;
  // Initialize Timer
  late Timer _timer;
  // Timer state for UI
  String timerState = 'resetted';
  String undelayedTimerState = 'resetted';
  bool startUp = true;
  bool successful = false;
  int distance = 0;

  @override
  void initState() {
    checkHours();
    super.initState();
    _timer = Timer(Duration.zero, () {});
    _timer.cancel();
    timerState = 'resetted';
    undelayedTimerState = 'resetted';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timerState = 'started';
    undelayedTimerState = 'started';
    startUp = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timeCounter < totalTime) {
          _timeCounter++;
        } else {
          successful = true;
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
    undelayedTimerState = 'stopped';
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        timerState = 'stopped';
      });
    });
  }

  void checkHours() {
    hours = ((totalTime - _timeCounter) ~/ 3600);
  }

  void resetTimer() {
    undelayedTimerState = 'resetted';
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        timerState = 'resetted';
        _timeCounter = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double widthRatio = size.width / 420;
    double heightRatio = size.height / 933.6;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: timerState == 'started' ? 0 : 1,
                  child: IgnorePointer(
                    ignoring: timerState == 'started',
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: secondaryColor,
                              context: context,
                              builder: (BuildContext context) {
                                return HomeMenu(
                                  activePage: "home",
                                  modalContext: context,
                                  widthRatio: widthRatio,
                                );
                              });
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 32 * heightRatio),
                            alignment: Alignment.center,
                            height: 48 * widthRatio,
                            width: 48 * widthRatio,
                            child: SvgPicture.asset("assets/icons/menu.svg")),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 24 * heightRatio),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: darkOutineColor,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: timerState == 'resetted'
                                  ? totalTime <= 900
                                      ? 0.3
                                      : 1
                                  : 0,
                              child: IgnorePointer(
                                  ignoring: timerState != 'resetted' ||
                                      totalTime <= 900,
                                  child: AnimatedButton(
                                    onTapUp: () {
                                      if (totalTime > 900) {
                                        setState(() {
                                          totalTime -= 900;
                                          checkHours();
                                        });
                                      }
                                    },
                                    variant: 'icon',
                                    assetFile: "assets/icons/minus.svg",
                                    margin: 200 * widthRatio,
                                    widthRatio: widthRatio,
                                  )),
                            ),
                            TweenAnimationBuilder(
                              duration: const Duration(seconds: 5),
                              tween: Tween(begin: 0.0, end: 1.0),
                              curve: Curves.easeOutCubic,
                              builder: (BuildContext context, dynamic value,
                                  Widget? child) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AnimatedOpacity(
                                      opacity: undelayedTimerState != 'resetted'
                                          ? 1
                                          : 0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: CustomPaint(
                                        painter: MainPainter(
                                            timeElapsed: _timeCounter,
                                            totalTime: totalTime,
                                            aniValue: value,
                                            widthRatio: widthRatio),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 240 * widthRatio,
                                        width: 240 * widthRatio,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 3, color: lightColor)),
                                        child: startUp == true ||
                                                timerState != 'stopped'
                                            ? AnimatedOpacity(
                                                opacity: undelayedTimerState !=
                                                        'stopped'
                                                    ? 1
                                                    : 0,
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
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
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Text(
                                                                '${(totalTime - _timeCounter) ~/ 3600}',
                                                                style: TextStyle(
                                                                    fontSize: 48 *
                                                                        widthRatio,
                                                                    color:
                                                                        lightColor),
                                                              ),
                                                              Text(
                                                                'h',
                                                                style: TextStyle(
                                                                    fontSize: 16 *
                                                                        widthRatio,
                                                                    color:
                                                                        lightColor),
                                                              ),
                                                            ],
                                                          )),
                                                      Text(
                                                        ((totalTime - _timeCounter)
                                                                    .remainder(
                                                                        3600) ~/
                                                                60)
                                                            .toString()
                                                            .padLeft(2, '0'),
                                                        style: TextStyle(
                                                            fontSize:
                                                                (hours <= 0
                                                                        ? 64
                                                                        : 48) *
                                                                    widthRatio,
                                                            color: lightColor),
                                                      ),
                                                      Text(
                                                        'm',
                                                        style: TextStyle(
                                                            fontSize:
                                                                16 * widthRatio,
                                                            color: lightColor),
                                                      ),
                                                      Text(
                                                        (totalTime -
                                                                _timeCounter)
                                                            .remainder(60)
                                                            .toString()
                                                            .padLeft(2, '0'),
                                                        style: TextStyle(
                                                            fontSize:
                                                                (hours <= 0
                                                                        ? 32
                                                                        : 24) *
                                                                    widthRatio,
                                                            color: lightColor),
                                                      ),
                                                      Text(
                                                        's',
                                                        style: TextStyle(
                                                            fontSize:
                                                                16 * widthRatio,
                                                            color: lightColor),
                                                      ),
                                                    ]),
                                              )
                                            : successful
                                                ? AnimatedOpacity(
                                                    opacity:
                                                        undelayedTimerState ==
                                                                'stopped'
                                                            ? 1
                                                            : 0,
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              56 * heightRatio,
                                                        ),
                                                        Text(
                                                          'Success!',
                                                          style: TextStyle(
                                                              color:
                                                                  lightSuccessColor,
                                                              fontSize: 32 *
                                                                  widthRatio,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 24),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Time: ',
                                                                style: TextStyle(
                                                                    color:
                                                                        lightColor,
                                                                    fontSize: 20 *
                                                                        widthRatio,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                '${totalTime ~/ 3600}:${((totalTime % 3600) ~/ 60).toString().padLeft(2, '0')}:${(totalTime).remainder(60).toString().padLeft(2, '0')}',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      lightColor,
                                                                  fontSize: 20 *
                                                                      widthRatio,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 24),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Distance: ',
                                                                style: TextStyle(
                                                                    color:
                                                                        lightColor,
                                                                    fontSize: 20 *
                                                                        widthRatio,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                '12345km',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      lightColor,
                                                                  fontSize: 20 *
                                                                      widthRatio,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : AnimatedOpacity(
                                                    opacity:
                                                        undelayedTimerState ==
                                                                'stopped'
                                                            ? 1
                                                            : 0,
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              56 * heightRatio,
                                                        ),
                                                        Text(
                                                          'Failure',
                                                          style: TextStyle(
                                                              color:
                                                                  lightFailureColor,
                                                              fontSize: 32 *
                                                                  widthRatio,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 24),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Failed: ',
                                                                style: TextStyle(
                                                                    color:
                                                                        lightColor,
                                                                    fontSize: 20 *
                                                                        widthRatio,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                '${_timeCounter ~/ 3600}:${((_timeCounter % 3600) ~/ 60).toString().padLeft(2, '0')}:${(_timeCounter).remainder(60).toString().padLeft(2, '0')}',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      lightColor,
                                                                  fontSize: 20 *
                                                                      widthRatio,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 24),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Time left: ',
                                                                style: TextStyle(
                                                                    color:
                                                                        lightColor,
                                                                    fontSize: 20 *
                                                                        widthRatio,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                '${(totalTime - _timeCounter) ~/ 3600}:${(((totalTime - _timeCounter) % 3600) ~/ 60).toString().padLeft(2, '0')}:${(totalTime - _timeCounter).remainder(60).toString().padLeft(2, '0')}',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      lightColor,
                                                                  fontSize: 20 *
                                                                      widthRatio,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )))
                                  ],
                                );
                              },
                            ),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: timerState == 'resetted'
                                  ? totalTime >= 7200
                                      ? 0.3
                                      : 1
                                  : 0,
                              child: IgnorePointer(
                                  ignoring: timerState != 'resetted' ||
                                      totalTime >= 7200,
                                  child: AnimatedButton(
                                    onTapUp: () {
                                      if (totalTime < 7200) {
                                        setState(() {
                                          totalTime += 900;
                                          checkHours();
                                        });
                                      }
                                    },
                                    variant: 'icon',
                                    assetFile: "assets/icons/plus.svg",
                                    margin: 200 * widthRatio,
                                    widthRatio: widthRatio,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 36 * heightRatio),
                        AnimatedButton(
                          text: timerState == 'started'
                              ? 'Stop'
                              : timerState == 'stopped'
                                  ? 'Reset'
                                  : 'Start',
                          onTapUp: () {
                            setState(() {
                              if (timerState == 'started') {
                                successful = false;
                                stopTimer();
                              } else if (timerState == 'stopped') {
                                resetTimer();
                              } else if (timerState == 'resetted') {
                                startTimer();
                              }
                            });
                          },
                          variant: "text",
                          widthRatio: widthRatio,
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
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
