
import 'package:flutter/material.dart';
import 'package:twist_food/utils/styles.dart';


class ProfileViw extends StatefulWidget {
  const ProfileViw({super.key});

  @override
  State<ProfileViw> createState() => _ProfileViwState();
}

class _ProfileViwState extends State<ProfileViw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile",
          style: TwistStyles.w600.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}