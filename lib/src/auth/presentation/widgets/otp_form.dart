import 'package:flutter/material.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/text_localization.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    required this.otpControllers,
    required this.formKey,
    super.key,
  });

  final List<TextEditingController> otpControllers;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < 6; i++)
                  IFields(
                    controller: otpControllers[i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 2,
                    width: 50,
                    showCursor: false,
                    onTap: () {
                      otpControllers[i].selection = TextSelection.fromPosition(
                        TextPosition(offset: otpControllers[i].text.length),
                      );
                    },
                    onChanged: (value) {
                      // if length == 2 then remove the first character
                      if (value.length == 2) {
                        otpControllers[i].text = value.substring(1);
                      }
                      if (i == 5) {
                        FocusScope.of(context).unfocus();
                      } else if (value.isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      Tz.getOtpText(OtpText.timeLeft),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colours.txtDarkColour,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '00:30',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colours.primaryColour,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    for (var i = 0; i < 6; i++) {
                      otpControllers[i].clear();
                    }
                  },
                  child: Text(
                    Tz.getOtpText(OtpText.resendOtp),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colours.txtDarkColour,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
