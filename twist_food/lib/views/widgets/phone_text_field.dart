import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class PhoneTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final TextInputType keyboardType;
  final TextEditingController phoneController;

  const PhoneTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    required this.keyboardType,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: TwistColor.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: TwistColor.borderColor)),
      child: TextFormField(
        controller: phoneController,
        keyboardType: keyboardType,
        maxLength: 12,
        cursorColor: TwistColor.black,
        style: TwistStyles.w500.copyWith(fontSize: 16.0),
        inputFormatters: [
          MaskedInputFormatter('## ### ## ##'),
          FilteringTextInputFormatter.allow(RegExp('[0-9 ]')),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          prefixIcon: icon,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
          hintText: hintText,
          hintStyle: TwistStyles.w400
              .copyWith(color: TwistColor.C_3B3B3B.withOpacity(.5)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
