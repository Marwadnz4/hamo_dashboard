import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hamo_dashboard/route/app_routes.dart';
import 'package:hamo_dashboard/ui/screens/navbar_screen.dart';
import 'package:hamo_dashboard/ui/screens/add_banner_screen.dart';
import 'package:hamo_dashboard/ui/screens/add_category_screen.dart';
import 'package:hamo_dashboard/ui/screens/login_screen.dart';
import 'package:hamo_dashboard/ui/screens/add_service_screen.dart';

List<GetPage> appPages = [
  GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
  GetPage(
    name: AppRoutes.navigationBarScreen,
    page: () => NavigationBarScreen(),
  ),
  GetPage(name: AppRoutes.addBannerScreen, page: () => AddBannerScreen()),
  GetPage(name: AppRoutes.addServiceScreen, page: () => AddServiceScreen()),
  GetPage(name: AppRoutes.addCategoryScreen, page: () => AddCategoryScreen()),
];
