import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/widgets/app_button.dart';
import 'package:hamo_dashboard/widgets/app_text_form_field.dart';
import 'package:hamo_dashboard/widgets/custom_back_button.dart';
import 'package:hamo_dashboard/widgets/custom_card.dart';
import 'package:hamo_dashboard/widgets/upload_image.dart';
import 'package:hamo_dashboard/controllers/add_category_controller.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  final AddCategoryController addCategoryController = Get.put(
    AddCategoryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 200, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    Text('Add Category', style: TextStyles.font26PrimaryMedium),
                    const Spacer(),
                  ],
                ),
                verticalSpace(40),
                CustomCard(
                  child: Form(
                    key: addCategoryController.formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          controller:
                              addCategoryController.categoryNameController,
                          hintText: "Insert Category Name",
                          labelText: "Category Name",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid Category Name';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(25),
                        UploadImage(
                          labelText: 'Category Cover Image',
                          imagePath: (bytes) {
                            addCategoryController.bytes = bytes;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(28),
                Obx(
                  () =>
                      addCategoryController.isLoading.value == false
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton(
                                buttonText: 'Cancel',
                                width: 100,
                                hasBorder: true,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              horizontalSpace(20),
                              AppButton(
                                buttonText: 'Add',
                                width: 200,
                                onPressed: () {
                                  if (addCategoryController
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    addCategoryController.uploadCover();
                                  }
                                },
                              ),
                            ],
                          )
                          : CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ),
                ),
                if (addCategoryController.isAdded.value)
                  Text(
                    'The Category added Successfully',
                    style: TextStyles.font16PrimaryMedium,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
