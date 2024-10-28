import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vendio_id/core/utils/core_utils.dart';
import 'package:vendio_id/src/auth/presentation/views/sign_in_screen.dart';

import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../dashboard/presentation/views/dashboard.dart';
import '../bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const SignInWithCredentialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          CoreUtils.showSnackBar(context, state.message, successStatus: false);
        } else if (state is AuthNotSignedIn) {
          Navigator.of(context).pushReplacementNamed(SignInScreen.routeName);
        } else if (state is AuthSignedIn) {
          Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
        }
      },
      builder: (context, state) {
        return AnimatedSplashScreen(
          splash: MediaRes.appIconTag,
          nextScreen: const Dashboard(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colours.splashBackgroundColour,
          splashIconSize: 80,
          disableNavigation: true,
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
