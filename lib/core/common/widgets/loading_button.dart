import 'package:flutter/material.dart';

import '../../res/colours.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: height ?? 55,
        minWidth: width ?? 0,
      ),
      decoration: BoxDecoration(
        color: Colours.btnActiveColour,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colours.txtLightColour),
        ),
      ),
    );
  }
}
