import 'dart:math';

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

class Home extends StatelessWidget {
  const Home({super.key});

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
                    margin: const EdgeInsets.symmetric(vertical: 70),
                    alignment: Alignment.center,
                    height: 280,
                    width: 280,
                    decoration: const BoxDecoration(
                      color: darkOutineColor,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: outlineColor)),
                      child: Text(
                        "43:33",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
                Container(
                  //margin: const EdgeInsets.only(bottom: 80),
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
