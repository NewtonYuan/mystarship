import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/components/home_menu.dart';
import 'package:mystarship/tools/constants.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

// Home State
class _StoreState extends State<Store> {
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
                            return HomeMenu(
                              activePage: "store",
                              modalContext: context,
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
              ],
            ),
          ))
        ],
      ),
    );
  }
}
