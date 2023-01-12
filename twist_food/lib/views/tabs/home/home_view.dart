import 'package:flutter/material.dart';
import 'package:twist_food/utils/styles.dart';

class HomeViw extends StatefulWidget {
  const HomeViw({super.key});

  @override
  State<HomeViw> createState() => _HomeViwState();
}

class _HomeViwState extends State<HomeViw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TwistStyles.w600.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}
