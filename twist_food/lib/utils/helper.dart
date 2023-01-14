import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class Helper {
  static void showTopSnackbarError({
    required BuildContext context,
    required String message,
  }) =>
      showTopSnackBar(
        Overlay.of(context)!,
        CustomSnackBar.error(message: message),
      );
  static void showBottomSnackbarError({
    required BuildContext context,
    required String message,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          backgroundColor: TwistColor.red.withOpacity(.8),
          content: Text(
            'User already exist',
            style: TwistStyles.w500.copyWith(
              color: TwistColor.white,
            ),
          ),
        ),
      );
}
