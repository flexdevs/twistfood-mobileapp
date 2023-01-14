import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twist_food/data/db/storage.dart';
import 'package:twist_food/routes/routes.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      if (LocalStorage.instance.getString(key: 'token').isNotEmpty) {
        Get.offAndToNamed(TwistRoutes.getTabBoxRoute());
      } else {
        Get.offAndToNamed(TwistRoutes.getLoginRoute());
      }
    });
    super.initState();
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
