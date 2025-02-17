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
import 'package:hamo_dashboard/controllers/add_service_controller.dart';
import 'package:hamo_dashboard/widgets/categories_drop_down_field.dart';
import 'package:hamo_dashboard/widgets/upload_multi_images.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({super.key});

  final AddServiceController addServiceController = Get.put(
    AddServiceController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 200),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(40),
                Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    Text('Add Service', style: TextStyles.font26PrimaryMedium),
                    const Spacer(),
                  ],
                ),
                verticalSpace(40),
                CustomCard(
                  child: Form(
                    key: addServiceController.formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                controller:
                                    addServiceController.serviceNameController,
                                hintText: "Insert Service Name",
                                labelText: "Service Name",
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid Service Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: CategoriesDropdownField(
                                selectedCategory: (category) {
                                  addServiceController.category = category;
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(25),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                controller:
                                    addServiceController
                                        .servicePresenterController,
                                hintText: "Insert Service Name",
                                labelText: "Service Name",
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid Service Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: AppTextFormField(
                                controller:
                                    addServiceController.servicePriceController,
                                hintText: "Insert Service Name",
                                labelText: "Service Name",
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid Service Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(25),
                        Expanded(
                          child: AppTextFormField(
                            controller:
                                addServiceController.descriptionController,
                            hintText: "Insert Service Name",
                            labelText: "Service Name",
                            keyboardType: TextInputType.name,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid Service Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        verticalSpace(25),
                        UploadImage(
                          labelText: 'Service Cover Image',
                          imagePath: (bytes) {
                            addServiceController.cover = bytes;
                          },
                        ),
                        verticalSpace(25),
                        const UploadMultiImagesBtn(),
                      ],
                    ),
                  ),
                ),
                verticalSpace(28),
                Obx(
                  () =>
                      addServiceController.isLoading.value == false
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton(
                                buttonText: 'Cancel',
                                width: 200,
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
                                  if (addServiceController.formKey.currentState!
                                      .validate()) {
                                    addServiceController.uploadCover();
                                  }
                                },
                              ),
                            ],
                          )
                          : CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ),
                ),
                if (addServiceController.isAdded.value)
                  Text(
                    'The Service added Successfully',
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
