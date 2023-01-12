import 'package:flutter/cupertino.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class LoginButton extends StatelessWidget {
  final String textButton;
  final VoidCallback onTap;
  const LoginButton({super.key, required this.textButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: TwistColor.primaryColor,
        ),
        child: Text(
          textButton,
          style: TwistStyles.w400
              .copyWith(fontSize: 16.0, color: TwistColor.white),
        ),
      ),
    );
  }
}
