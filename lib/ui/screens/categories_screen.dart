import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/ui/screens/add_category_screen.dart';
import 'package:hamo_dashboard/ui/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/ui/widgets/custom_card.dart';
import 'package:hamo_dashboard/view_models/get_categories_controller.dart';
import 'package:hamo_dashboard/ui/widgets/tabels/categories_table.dart';

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
              Text('Categories', style: TextStyles.font18PrimaryMedium),
              IconButton(
                onPressed: () {
                  getCategoriesController.getCategories();
                },
                icon: Icon(
                  Icons.refresh,
                  color: ColorsManager.primary,
                  size: 25,
                ),
              ),
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
