import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/screens/add_banner_screen.dart';
import 'package:hamo_dashboard/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/widgets/custom_card.dart';
import 'package:hamo_dashboard/controllers/get_banners_controller.dart';
import 'package:hamo_dashboard/widgets/tabels/banners_table.dart';

class BannersScreen extends StatelessWidget {
  const BannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetBannersController getBannersController = Get.put(
      GetBannersController(),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Banners', style: TextStyles.font26PrimaryMedium),
              const Spacer(),
              AppButtonWithIcon(
                buttonText: 'Add Banner',
                icon: Icons.add_circle_outline_rounded,
                width: 200,
                onPressed: () {
                  Get.to(() => AddBannerScreen());
                },
              ),
            ],
          ),
          verticalSpace(40),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CustomCard(
                child: SingleChildScrollView(
                  child: Obx(
                    () =>
                        getBannersController.isLoading.value == false
                            ? BannersTable(
                              getBannersController: getBannersController,
                            )
                            : CircularProgressIndicator(
                              color: ColorsManager.primary,
                            ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
