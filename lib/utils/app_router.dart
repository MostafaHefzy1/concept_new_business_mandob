import 'package:get/get.dart';
import '../views/screens/intro_screen.dart';
import '../views/screens/login_screen.dart';

import '../views/screens/orders_view/orders_representative_screen.dart';

class AppRoutes {
  static String initialRoute = "/splach-screen";
  static String loginScreen = "/login-screen";
  static String homeScreen = "/home-screen";
  static String order = "/order";
  static String orderDetailsScreen = "/orderDetails-screen";

  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const IntroScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: order, page: () => const OrdersRepresentativeScreen()),
  ];
}
