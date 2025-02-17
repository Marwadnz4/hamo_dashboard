import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hamo_dashboard/core/routing/routes.dart';
import 'package:hamo_dashboard/screens/navbar_screen.dart';
import 'package:hamo_dashboard/screens/add_banner_screen.dart';
import 'package:hamo_dashboard/screens/add_category_screen.dart';
import 'package:hamo_dashboard/screens/login_screen.dart';
import 'package:hamo_dashboard/screens/add_service_screen.dart';

List<GetPage> appPage = [
  GetPage(name: AppRouter.loginScreen, page: () => LoginScreen()),
  GetPage(
    name: AppRouter.navigationBarScreen,
    page: () => NavigationBarScreen(),
  ),
  GetPage(name: AppRouter.addBannerScreen, page: () => AddBannerScreen()),
  GetPage(name: AppRouter.addServiceScreen, page: () => AddServiceScreen()),
  GetPage(name: AppRouter.addCategoryScreen, page: () => AddCategoryScreen()),
];
