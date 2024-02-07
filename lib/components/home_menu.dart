import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/pages/settings.dart';
import 'package:mystarship/pages/store.dart';
import 'package:mystarship/tools/constants.dart';
import 'package:mystarship/pages/home.dart';
import 'package:mystarship/pages/statistics.dart';

class HomeMenu extends StatelessWidget {
  final String activePage;
  final BuildContext modalContext;

  const HomeMenu({
    super.key,
    required this.activePage,
    required this.modalContext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 24),
          height: 80,
          width: 96,
          child: SvgPicture.asset("assets/icons/bar.svg"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'home') {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Home(),
                      ),
                    );
                  } else {
                    Navigator.pop(modalContext);
                  }
                },
                highlightColor: selectedColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 18, left: 56),
                  color: activePage == 'home' ? activeColor : null,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 24),
                        height: 48,
                        width: 48,
                        child: SvgPicture.asset("assets/icons/home.svg"),
                      ),
                      const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 24,
                          color: lightColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'statistics') {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Statistics(),
                      ),
                    );
                  } else {
                    Navigator.pop(modalContext);
                  }
                },
                highlightColor: selectedColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 18, left: 56),
                  color: activePage == 'statistics' ? activeColor : null,
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24),
                      height: 48,
                      width: 48,
                      child: SvgPicture.asset("assets/icons/statistics.svg"),
                    ),
                    const Text("Statistics",
                        style: TextStyle(
                            fontSize: 24,
                            color: lightColor,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'store') {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Store(),
                      ),
                    );
                  } else {
                    Navigator.pop(modalContext);
                  }
                },
                highlightColor: selectedColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 18, left: 56),
                  color: activePage == 'store' ? activeColor : null,
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24),
                      height: 48,
                      width: 48,
                      child: SvgPicture.asset("assets/icons/store.svg"),
                    ),
                    const Text("Store",
                        style: TextStyle(
                            fontSize: 24,
                            color: lightColor,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'settings') {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Settings(),
                      ),
                    );
                  } else {
                    Navigator.pop(modalContext);
                  }
                },
                highlightColor: selectedColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 18, bottom: 18, left: 56),
                  color: activePage == 'settings' ? activeColor : null,
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24),
                      height: 48,
                      width: 48,
                      child: SvgPicture.asset("assets/icons/settings.svg"),
                    ),
                    const Text("Settings",
                        style: TextStyle(
                            fontSize: 24,
                            color: lightColor,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
