import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/helpers/spacing.dart';
import 'package:hamo_dashboard/core/routing/routes.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/screens/banners_screen.dart';
import 'package:hamo_dashboard/screens/booked_services_screen.dart';
import 'package:hamo_dashboard/models/tab_model.dart';
import 'package:hamo_dashboard/screens/categories_screen.dart';
import 'package:hamo_dashboard/screens/services_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int indexSelected = 0;

  List<TabModel> tabs = [
    TabModel(
      icon: Icons.dashboard_rounded,
      title: 'Booked Services',
      screen: BookedServicesScreen(),
    ),
    TabModel(
      icon: Icons.category_rounded,
      title: 'Categories',
      screen: CategoriesScreen(),
    ),
    TabModel(
      icon: Icons.help,
      title: 'Services',
      screen: const ServicesScreen(),
    ),
    TabModel(
      icon: Icons.app_settings_alt_outlined,
      title: 'Banners',
      screen: const BannersScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              color: ColorsManager.primary,
              child: Column(
                children: [
                  verticalSpace(30),
                  ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      'assets/images/white_logo.png',
                      height: 35,
                    ),
                    title: Text("Hamo", style: TextStyles.font28WhiteBold),
                  ),
                  verticalSpace(20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: tabs.length,
                      itemBuilder:
                          (BuildContext context, int index) => InkWell(
                            onTap:
                                () => setState(() {
                                  indexSelected = index;
                                }),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              color:
                                  indexSelected == index
                                      ? ColorsManager.background
                                      : null,
                              child: Row(
                                spacing: 20,
                                children: [
                                  Icon(
                                    tabs[index].icon,
                                    size: indexSelected == index ? 30 : 20,
                                    color:
                                        indexSelected == index
                                            ? ColorsManager.primary
                                            : Colors.white,
                                  ),
                                  Text(
                                    tabs[index].title,
                                    style:
                                        indexSelected == index
                                            ? TextStyles.font18PrimaryMedium
                                            : TextStyles.font14WhiteMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => verticalSpace(5),
                    ),
                  ),
                  verticalSpace(20),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: Text("Logout", style: TextStyles.font18WhiteMedium),
                    onTap: () => Get.to(AppRouter.loginScreen),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
            Expanded(child: tabs[indexSelected].screen),
          ],
        ),
      ),
    );
  }
}
