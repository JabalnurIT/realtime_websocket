import 'package:vendio_id/core/res/text_localization.dart';
import 'package:vendio_id/src/auth/presentation/views/otp_screen.dart';

import '../../../../core/common/widgets/loading_button.dart';
import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/core_utils.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthFailure) {
            CoreUtils.showSnackBar(
              context,
              state.message,
              successStatus: false,
            );
          } else if (state is AuthOtpRequested) {
            Navigator.of(context).pushNamed(
              OtpScreen.routeName,
              arguments: phoneNumberController.text,
            );
          }
        },
        builder: (context, state) {
          final topPadding = MediaQuery.of(context).padding.top;
          final bottomPadding = MediaQuery.of(context).padding.bottom;
          final screenHeight =
              MediaQuery.of(context).size.height - topPadding - bottomPadding;
          final screenWidth = MediaQuery.of(context).size.width;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: topPadding,
                bottom: bottomPadding,
                left: topPadding / 2,
                right: topPadding / 2,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.75,
                    child: Image.asset(
                      MediaRes.appIconTag,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.25,
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
                            Tz.getSignInText(SignInText.signIn),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colours.txtDarkColour,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SignInForm(
                            phoneNumberController: phoneNumberController,
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
                          context.read<AuthBloc>().add(
                              SignInWithPhoneNumberEvent(
                                  phoneNumber: phoneNumberController.text));
                        }
                      },
                      text: Tz.getSignInText(SignInText.sentOTP),
                      maxWidth: true,
                    ),
                  SizedBox(height: topPadding),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
