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
  final double widthRatio;

  const HomeMenu({
    super.key,
    required this.activePage,
    required this.modalContext,
    required this.widthRatio,
  });

  void navigateAfterAnimation(BuildContext context, Widget nextPage) {
    Navigator.pop(context);
    Future.delayed(const Duration(milliseconds: 180), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        ),
      );
    });
  }

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
                    navigateAfterAnimation(context, const Home());
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
                        height: 48 * widthRatio,
                        width: 48 * widthRatio,
                        child: SvgPicture.asset("assets/icons/home.svg"),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 24 * widthRatio,
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
                    navigateAfterAnimation(context, const Statistics());
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
                      height: 48 * widthRatio,
                      width: 48 * widthRatio,
                      child: SvgPicture.asset("assets/icons/statistics.svg"),
                    ),
                    Text("Statistics",
                        style: TextStyle(
                            fontSize: 24 * widthRatio,
                            color: lightColor,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'store') {
                    navigateAfterAnimation(context, const Store());
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
                      height: 48 * widthRatio,
                      width: 48 * widthRatio,
                      child: SvgPicture.asset("assets/icons/store.svg"),
                    ),
                    Text("Store",
                        style: TextStyle(
                            fontSize: 24 * widthRatio,
                            color: lightColor,
                            fontWeight: FontWeight.w500)),
                  ]),
                ),
              ),
              InkWell(
                onTapUp: (TapUpDetails details) {
                  if (activePage != 'settings') {
                    navigateAfterAnimation(context, const Settings());
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
                      height: 48 * widthRatio,
                      width: 48 * widthRatio,
                      child: SvgPicture.asset("assets/icons/settings.svg"),
                    ),
                    Text("Settings",
                        style: TextStyle(
                            fontSize: 24 * widthRatio,
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
