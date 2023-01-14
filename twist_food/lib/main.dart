import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twist_food/data/db/storage.dart';
import 'package:twist_food/routes/routes.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/views/splash/splash_view.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
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
    return GetMaterialApp(
      scaffoldMessengerKey: snackbarKey,
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
      home: const SplashView(),
    );
  }
}
