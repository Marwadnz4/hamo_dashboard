import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/helpers/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/screens/add_category_screen.dart';
import 'package:hamo_dashboard/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/widgets/custom_card.dart';
import 'package:hamo_dashboard/controllers/get_categories_controller.dart';
import 'package:hamo_dashboard/widgets/tabels/categories_table.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final GetCategoriesController getCategoriesController = Get.put(
    GetCategoriesController(),
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
              Text('Categories', style: TextStyles.font26PrimaryMedium),
              const Spacer(),
              AppButtonWithIcon(
                buttonText: 'Add Category',
                icon: Icons.add_circle_outline_rounded,
                width: 200,
                onPressed: () {
                  Get.to(() => AddCategoryScreen());
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
                        getCategoriesController.isLoading.value == false
                            ? CategoriesTable(
                              getCategoriesController: getCategoriesController,
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
