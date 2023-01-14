import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/data/db/storage.dart';
import 'package:twist_food/data/services/api/api_service.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/verify_view/app_bar_back.dart';
import 'package:twist_food/views/tabs/tab_box/tab_box.dart';

class VerifiyScreen extends StatefulWidget {
  VerifiyScreen({
    super.key,
    required this.phoneNumber,
    this.userName,
    required this.toLogin,
  });

  String? userName;
  String phoneNumber;
  bool toLogin;
  Duration duration = Duration(minutes: 2);

  @override
  State<VerifiyScreen> createState() => _VerifiyScreenState();
}

class _VerifiyScreenState extends State<VerifiyScreen> {
  final TextEditingController pinController = TextEditingController();
  ApiService apiService = ApiService();
  bool isVerified = true;
  late Timer _timer;
  int mySeconds = 120;
  bool sendAgainButton = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 19.0,
            ),
            Flexible(
              child: Text(
                'Code send to +998${widget.phoneNumber.substring(0, 6)}****',
              ),
            ),
            SizedBox(
              height: 38.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  controller: pinController,
                  onCompleted: (value) async {
                    if (widget.toLogin) {
                      await apiService
                          .verifyCode(
                        phoneNumber: widget.phoneNumber.replaceAll(' ', ''),
                        code: int.parse(pinController.text),
                        context: context,
                      )
                          .then((value) async {
                        isVerified = value;
                        if (isVerified) {
                          await loginUser(context);
                        }
                      });
                    } else {
                      await apiService
                          .verifyCode(
                        phoneNumber: widget.phoneNumber.replaceAll(' ', ''),
                        code: int.parse(pinController.text),
                        context: context,
                      )
                          .then((value) async {
                        isVerified = value;
                        if (isVerified) {
                          await register(context);
                        }
                      });

                      setState(() {});
                    }
                  },
                  errorText: 'Wrong code!',
                  forceErrorState: !isVerified,
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                convertToMinute(mySeconds),
                style: TwistStyles.w500,
              ),
            ),
            Center(
              child: Visibility(
                  visible: sendAgainButton,
                  child: TextButton(
                    child: Text(
                      'Send code again',
                      style: TwistStyles.w500.copyWith(color: TwistColor.red),
                    ),
                    onPressed: () async {
                      await apiService.sendCodeToPhone(
                        context: context,
                        phoneNumber: widget.phoneNumber.replaceAll(' ', ''),
                      );
                      setState(() {
                        sendAgainButton = false;
                      });
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    await apiService
        .loginUser(
      phoneNumber: widget.phoneNumber.replaceAll(' ', ''),
      context: context,
    )
        .then((value) async {
      if (value.isNotEmpty) {
        LocalStorage.instance.setString(value: value, key: 'token');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TabBox(),
          ),
        );
      }
    });
  }

  String convertToMinute(int mySeconds) {
    if (mySeconds % 60 < 10) {
      return '0${mySeconds ~/ 60}:0${mySeconds % 60}';
    }
    return '0${mySeconds ~/ 60}:${mySeconds % 60}';
  }

  Future<void> register(BuildContext context) async {
    await apiService
        .registerUser(
      userName: widget.userName!,
      phoneNumber: widget.phoneNumber.replaceAll(' ', ''),
      context: context,
    )
        .then((value) {
      if (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabBox(),
          ),
        );
      } else {
        showTopSnackBar(
          Overlay.of(context)!,
          const CustomSnackBar.error(message: 'User already exist'),
        );
      }
    });
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mySeconds > 0) {
        if (mounted) {
          setState(() {
            mySeconds--;
          });
        }
      } else {
        if (mySeconds == 0) {
          showTopSnackBar(Overlay.of(context)!,
              CustomSnackBar.error(message: 'Verify code expired'));
        }

        setState(() {
          sendAgainButton = true;
        });
        _timer.cancel();
      }
    });
  }
}
