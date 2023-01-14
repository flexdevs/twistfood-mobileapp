import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twist_food/data/db/storage.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/views/splash/splash_view.dart';
import 'package:twist_food/views/tabs/tab_box/tab_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.instance.sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        scaffoldBackgroundColor: TwistColor.scaffoldColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: TwistColor.scaffoldColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        primarySwatch: white,
        primaryColor: TwistColor.primaryColor,
      ),
      home: const SplashView(),
    );
  }
}
