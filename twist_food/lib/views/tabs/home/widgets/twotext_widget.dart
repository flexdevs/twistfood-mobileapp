import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';

class TwoRowTextWidget extends StatelessWidget {
  const TwoRowTextWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TwistStyles.w500.copyWith(
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "View More",
              style: TwistStyles.w500
                  .copyWith(fontSize: 15, color: TwistColor.C_FF7C32),
            ),
          )
        ],
      ),
    );
  }
}
