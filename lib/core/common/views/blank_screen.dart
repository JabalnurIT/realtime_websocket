import 'package:flutter/material.dart';

import '../../res/colours.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({
    super.key,
    this.title,
  });

  static const String routeName = '/blank';

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? '404 - Page not found',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colours.primaryColour,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title == null
                ? const Icon(
                    Icons.construction,
                    size: 100,
                    color: Colours.txtDarkColour,
                  )
                : const SizedBox.shrink(),
            Text(
              title ?? '404 - Page not found',
              style: const TextStyle(
                color: Colours.txtDarkColour,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
