import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystarship/tools/constants.dart';

class AnimatedButton extends StatefulWidget {
  final String? text;
  final VoidCallback onTapUp;
  final String variant;
  final String? assetFile;
  final double? margin;

  const AnimatedButton(
      {Key? key,
      this.text,
      required this.onTapUp,
      required this.variant,
      this.assetFile,
      this.margin})
      : super(key: key);

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onTapUp();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: widget.margin ?? 0),
        height: widget.variant == 'text' ? 50 : 48,
        width: widget.variant == 'text' ? 150 : 48,
        decoration: widget.variant == 'text'
            ? BoxDecoration(
                color: isPressed ? lightColor : primaryColor,
                shape: BoxShape.rectangle,
                border: Border.all(width: 3, color: lightColor),
                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                color: isPressed ? lightColor : primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
        child: widget.variant == 'text'
            ? Text(
                widget.text ?? '',
                style: TextStyle(
                  fontSize: 24,
                  color: isPressed ? primaryColor : lightColor,
                ),
              )
            : SvgPicture.asset(widget.assetFile ?? ''),
      ),
    );
  }
}
