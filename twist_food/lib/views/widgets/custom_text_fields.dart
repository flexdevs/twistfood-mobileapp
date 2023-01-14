import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? icon;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    required this.keyboardType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: TwistColor.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: TwistColor.borderColor)),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: TwistColor.black,
        style: TwistStyles.w400.copyWith(fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
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
