import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/verify_view/app_bar_back.dart';

class VerifiyScreen extends StatelessWidget {
  VerifiyScreen({super.key, required this.phoneNumber});
  final TextEditingController pinController = TextEditingController();
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    phoneNumber = '99 995 58 76';
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Enter 4-digit\nVerification code',
                style: TwistStyles.w500.copyWith(fontSize: 25.0),
              ),
            ),
            SizedBox(height: 19.0),
            Flexible(
              child: Text(
                'Code send to +998${phoneNumber.substring(0, 6)}****',
              ),
            ),
            SizedBox(height: 38.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  controller: pinController,
                  onCompleted: (value) => print(value),
                  errorText: 'Wrong code!',
                  forceErrorState: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
