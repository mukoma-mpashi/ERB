// lib/routes/app_pages.dart (corrected version)
import 'package:get/get.dart';
import '../screens/dashboard_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DashboardScreen;

  static final routes = [
    GetPage(
      name: Routes.DashboardScreen,
      page: () => const DashboardScreen(),
      transition: Transition.fade,

      // middlewares: [
      //   AuthMiddleware(),
      // ],
    ),

  ];
}