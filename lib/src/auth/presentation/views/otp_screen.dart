import '../../../../core/common/widgets/app_bar_core.dart';
import '../../../../core/common/widgets/loading_button.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/res/text_localization.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../dashboard/presentation/views/dashboard.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/otp_form.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const routeName = '/sign-in-otp';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpControllers = List.generate(6, (index) => TextEditingController());
  final formKey = GlobalKey<FormState>();
  Object? args;

  @override
  void initState() {
    super.initState();
    addListener();
  }

  void addListener() {
    for (var i = 0; i < otpControllers.length; i++) {
      otpControllers[i].addListener(() => setState(() {}));
    }
  }

  bool get isOtpFilled {
    return otpControllers.every((element) => element.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colours.backgroundColour,
      extendBodyBehindAppBar: true,
      appBar: const AppBarCore(
        title: "",
        isBackButton: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthFailure) {
            CoreUtils.showSnackBar(
              context,
              state.message,
              successStatus: false,
            );
          } else if (state is AuthUserNotFound) {
            CoreUtils.showSnackBar(
              context,
              Tz.getOtpText(OtpText.userNotFound),
              successStatus: false,
            );
            // Navigator.pop(context);
          } else if (state is AuthOtpFailed) {
            CoreUtils.showSnackBar(
              context,
              Tz.getOtpText(OtpText.otpNotCorrect),
              successStatus: false,
            );
            // Navigator.pop(context);
          } else if (state is AuthOtpVerified) {
            CoreUtils.showSnackBar(
              context,
              Tz.getOtpText(OtpText.loginSuccess),
            );
          } else if (state is AuthSignedIn) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Dashboard.routeName,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          final topPadding = MediaQuery.of(context).padding.top;
          final bottomPadding = MediaQuery.of(context).padding.bottom;
          final screenHeight =
              MediaQuery.of(context).size.height - topPadding - bottomPadding;
          final screenWidth = MediaQuery.of(context).size.width;
          return Padding(
            padding: EdgeInsets.only(
              top: topPadding / 2,
              bottom: bottomPadding,
              left: topPadding / 4,
              right: topPadding / 4,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.75,
                    child: Image.asset(
                      MediaRes.appIconTag,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.35,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: topPadding / 2,
                      ),
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Tz.getOtpText(OtpText.enterOtpCode),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colours.txtDarkColour,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          OTPForm(
                            otpControllers: otpControllers,
                            formKey: formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is AuthLoading)
                    const LoadingButton()
                  else
                    RoundedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(SendOtpEvent(
                              verificationId:
                                  otpControllers.map((e) => e.text).join()));
                        }
                      },
                      isDisabled: !isOtpFilled,
                      text: Tz.getOtpText(OtpText.confirmOtp),
                      maxWidth: true,
                      backgroundColor: isOtpFilled
                          ? Colours.btnActiveColour
                          : Colours.btnDisabledColour,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// const Text(
//                             'Enter 6 Digits Code',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colours.txtDarkColour,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           const Text(
//                             'sent to',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colours.txtDarkColour,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             args.toString(),
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colours.txtDarkColour,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           OTPForm(
//                             otpControllers: otpControllers,
//                             formKey: formKey,
//                           ),
//                           const Expanded(child: SizedBox.shrink()),
//                           if (state is AuthLoading)
//                             const LoadingButton()
//                           else
//                             RoundedButton(
//                               onPressed: () {
//                                 FocusManager.instance.primaryFocus?.unfocus();
//                                 if (formKey.currentState!.validate()) {
//                                   context.read<AuthBloc>().add(SendOtpEvent(
//                                       verificationId: otpControllers
//                                           .map((e) => e.text)
//                                           .join()));
//                                 }
//                               },
//                               text: 'NEXT',
//                             ),
//                           SizedBox(height: topPadding / 2),