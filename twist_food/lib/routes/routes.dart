import 'package:get/get.dart';
import 'package:twist_food/utils/constants.dart';
import 'package:twist_food/views/splash/splash_view.dart';
import 'package:twist_food/views/tabs/basket/basket_view.dart';
import 'package:twist_food/views/tabs/home/home_view.dart';
import 'package:twist_food/views/tabs/orders/orders_view.dart';
import 'package:twist_food/views/tabs/profile/profile_view.dart';
import 'package:twist_food/views/tabs/tab_box/tab_box.dart';

class TwistRoutes {
  static String getSplashRoute() => splashRoute;
  static String getTabBoxRoute() => tabBoxRoute;
  static String getHomeRoute() => homeRoute;
  static String getBasketRoute() => basketRoute;
  static String getOrdersRoute() => ordersRoute;
  static String getProfileRoute() => profileRoute;

  static List<GetPage> routes = [
    GetPage(name: splashRoute, page: () => const SplashView()),
    GetPage(name: tabBoxRoute, page: () => const TabBox()),
    GetPage(name: homeRoute, page: () => const HomeView()),
    GetPage(name: basketRoute, page: () => const BascketView()),
    GetPage(name: ordersRoute, page: () => const OrderView()),
    GetPage(name: profileRoute, page: () => const ProfileViw()),
  ];
}
