import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/helpers/spacing.dart';
import 'package:hamo_dashboard/core/routing/routes.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/widgets/custom_card.dart';
import 'package:hamo_dashboard/controllers/get_services_controller.dart';
import 'package:hamo_dashboard/widgets/table_cells/services_table.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetServicesController getServicesController = Get.put(
      GetServicesController(),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Services', style: TextStyles.font26PrimaryMedium),
              const Spacer(),
              AppButtonWithIcon(
                buttonText: 'Add Service',
                icon: Icons.add_circle_outline_rounded,
                width: 200,
                onPressed: () {
                  Get.toNamed(AppRouter.addServiceScreen);
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
                        getServicesController.isLoading.value == false
                            ? ServicesTable(
                              getServicesController: getServicesController,
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
