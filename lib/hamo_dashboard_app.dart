import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/constants.dart';
import 'package:hamo_dashboard/route/app_pages.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/screens/navbar_screen.dart';
import 'package:hamo_dashboard/ui/screens/login_screen.dart';

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
      home: isLoggedInUser ? NavigationBarScreen() : LoginScreen(),
      getPages: appPages,
    );
  }
}
