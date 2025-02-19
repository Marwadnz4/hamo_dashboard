import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/ui/screens/add_service_screen.dart';
import 'package:hamo_dashboard/ui/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/ui/widgets/custom_card.dart';
import 'package:hamo_dashboard/view_models/get_services_controller.dart';
import 'package:hamo_dashboard/ui/widgets/tabels/services_table.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});
  final GetServicesController getServicesController = Get.put(
    GetServicesController(),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Services', style: TextStyles.font18PrimaryMedium),
              IconButton(
                onPressed: () {
                  getServicesController.getServices();
                },
                icon: Icon(
                  Icons.refresh,
                  color: ColorsManager.primary,
                  size: 25,
                ),
              ),
              const Spacer(),
              AppButtonWithIcon(
                buttonText: 'Add Service',
                icon: Icons.add_circle_outline_rounded,
                width: 200,
                onPressed: () {
                  Get.to(() => AddServiceScreen());
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
