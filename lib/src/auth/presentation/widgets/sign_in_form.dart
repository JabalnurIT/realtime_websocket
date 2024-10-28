import 'package:flutter/material.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/res/text_localization.dart';
import '../../../../core/utils/core_utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.phoneNumberController,
    required this.formKey,
    super.key,
  });

  final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Tz.getSignInText(SignInText.phoneNumber),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  IFields(
                    controller: widget.phoneNumberController,
                    keyboardType: TextInputType.number,
                    hintText: Tz.getSignInText(SignInText.phoneNumberHint),
                    overrideValidator: true,
                    validator: (value) {
                      return CoreUtils.phoneNumberValidator(value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
