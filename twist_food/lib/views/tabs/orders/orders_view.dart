
import 'package:flutter/material.dart';
import 'package:twist_food/utils/styles.dart';


class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Orders",
          style: TwistStyles.w600.copyWith(fontSize: 30),
        ),
      ),
    );
  }
}