import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:realtime_websocket_flutter/src/dashboard/presentation/views/dashboard.dart';

import '../../../../core/res/media_res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: MediaRes.appIcon,
      nextScreen: const Dashboard(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
