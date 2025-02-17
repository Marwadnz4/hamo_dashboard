import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/helpers/constants.dart';
import 'package:hamo_dashboard/core/routing/app_router.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/screens/navbar_screen.dart';
import 'package:hamo_dashboard/screens/login_screen.dart';

class HamoDashboard extends StatelessWidget {
  const HamoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorsManager.primary,
        scaffoldBackgroundColor: ColorsManager.background,
      ),
      title: 'Hamo Dashboard',
      home:
          isLoggedInUser
              ? NavigationBarScreen()
              : LoginScreen(),
      getPages: appPage,
    );
  }
}
