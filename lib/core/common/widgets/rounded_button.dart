import 'package:flutter/material.dart';

import '../../res/colours.dart';
import '../../res/fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    required this.text,
    this.fontFamily,
    this.fontWeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.radius,
    this.icon,
    this.iconPositionFront = true,
    this.maxWidth = false,
    this.isDisabled = false,
    this.elevation,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final String text;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? radius;
  final Icon? icon;
  final bool iconPositionFront;
  final bool maxWidth;
  final bool isDisabled;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: InkWell(
        onDoubleTap: () {},
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: elevation ?? 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 50,
              vertical: verticalPadding ?? 17,
            ),
            minimumSize:
                Size(maxWidth ? MediaQuery.of(context).size.width : 0, 0),
            backgroundColor: backgroundColor ?? Colours.primaryColour,
            foregroundColor: foregroundColor ?? Colors.white,
          ),
          onPressed: () async {
            onPressed();
          },
          child: icon == null
              ? Text(
                  text,
                  style: TextStyle(
                    fontFamily: fontFamily ?? Fonts.inter,
                    fontWeight: fontWeight ?? FontWeight.bold,
                    color: foregroundColor ?? Colors.white,
                  ),
                )
              : SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (iconPositionFront) ? icon! : const SizedBox(),
                      (iconPositionFront)
                          ? const SizedBox(width: 10)
                          : const SizedBox(),
                      Text(
                        text,
                        style: TextStyle(
                          fontFamily: fontFamily ?? Fonts.inter,
                          fontWeight: fontWeight ?? FontWeight.bold,
                          color: foregroundColor ?? Colors.white,
                        ),
                      ),
                      (!iconPositionFront)
                          ? const SizedBox(width: 10)
                          : const SizedBox(),
                      (!iconPositionFront) ? icon! : const SizedBox(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
