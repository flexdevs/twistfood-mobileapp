import 'package:flutter/material.dart';
import 'package:twist_food/utils/styles.dart';

class BascketView extends StatefulWidget {
  const BascketView({super.key});

  @override
  State<BascketView> createState() => _BascketViewState();
}

class _BascketViewState extends State<BascketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Basket",
          style: TwistStyles.w600.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}
