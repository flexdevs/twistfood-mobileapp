import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: TwistColor.C_F9A84D.withOpacity(.1),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: TwistColor.C_DA6317,
          ),
        ),
      ),
    );
  }
}
