import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/constants.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
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
          padding: const EdgeInsets.only(left: 48, top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 48,
                  width: 48,
                  child: SvgPicture.asset("assets/icons/home.svg"),
                ),
                const Text("Home",
                    style: TextStyle(
                        fontSize: 24,
                        color: lightColor,
                        fontWeight: FontWeight.w500)),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 36),
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
              Padding(
                padding: const EdgeInsets.only(top: 36),
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
              Padding(
                padding: const EdgeInsets.only(top: 36),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
