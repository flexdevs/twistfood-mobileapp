import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/sign_in_view/sign_in_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TwistIcons.logo,
              height: 139.0,
              width: 175.0,
            ),
            Text(
              'TwistFood',
              style: TwistStyles.w600.copyWith(
                fontSize: 40.0,
                color: TwistColor.primaryColor,
              ),
            ),
            const Text(
              'Deliever Favorite Food',
              style: TwistStyles.w500,
            )
          ],
        ),
      ),
    );
  }
}
