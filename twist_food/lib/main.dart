import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twist_food/routes/routes.dart';
import 'package:twist_food/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Twist Food',
      debugShowCheckedModeBanner: false,
      initialRoute: TwistRoutes.getSplashRoute(),
      getPages: TwistRoutes.routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: TwistColor.scaffoldColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        primarySwatch: white,
        scaffoldBackgroundColor: TwistColor.scaffoldColor,
        primaryColor: TwistColor.primaryColor,
      ),
    );
  }
}
