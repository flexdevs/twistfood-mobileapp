import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;

  const CustomTextFormField({super.key, required this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TwistColor.white,
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TwistStyles.w400
              .copyWith(color: TwistColor.C_3B3B3B.withOpacity(.5)),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: TwistColor.borderColor),
          ),
        ),
      ),
    );
  }
}
