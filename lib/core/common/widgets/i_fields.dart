import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../res/colours.dart';
import '../../res/fonts.dart';

class IFields extends StatelessWidget {
  const IFields({
    super.key,
    this.validator,
    required this.controller,
    this.filled = false,
    this.fillColor,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixText,
    this.prefixOnTap,
    this.hintText,
    this.keyboardType,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.overrideValidator = false,
    this.hintStyle,
    this.fontWeight,
    this.width,
    this.showCursor,
    this.onTap,
    this.onChanged,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? prefixText;
  final void Function()? prefixOnTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final double? width;
  final TextAlign textAlign;
  final bool? showCursor;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, state) {
        return SizedBox(
          width: width ?? state.maxWidth,
          child: Stack(
            children: [
              TextFormField(
                enableInteractiveSelection: onTap == null,
                controller: controller,
                showCursor: showCursor,
                cursorWidth: showCursor == false ? 0 : 2,
                inputFormatters: [
                  if (keyboardType == TextInputType.number)
                    FilteringTextInputFormatter.digitsOnly,
                  if (maxLength != null)
                    LengthLimitingTextInputFormatter(maxLength),
                ],
                textAlign: textAlign,
                validator: overrideValidator
                    ? validator
                    : (value) {
                        if (value == null || value.isEmpty) {
                          return '**Field tidak boleh kosong';
                        }
                        return validator?.call(value);
                      },
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                onTap: onTap,
                onChanged: onChanged,
                keyboardType: keyboardType,
                obscureText: obscureText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  color: Colours.txtDarkColour,
                  fontFamily: Fonts.inter,
                ),
                readOnly: readOnly,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colours.borderColour),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Colours.primaryColour.withOpacity(1)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  filled: filled,
                  fillColor: fillColor,
                  suffixIcon: suffixIcon,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  prefixStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colours.primaryColour,
                  ),
                  prefixIcon: prefixText != null
                      ? GestureDetector(
                          onTap: prefixOnTap,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              prefixText!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: fontWeight ?? FontWeight.w400,
                                color: Colours.txtDarkColour,
                              ),
                            ),
                          ),
                        )
                      : null,
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colours.btnDisabledColour,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
