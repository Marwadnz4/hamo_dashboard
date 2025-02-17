import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/helpers/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/widgets/app_button.dart';
import 'package:hamo_dashboard/widgets/custom_back_button.dart';
import 'package:hamo_dashboard/widgets/custom_card.dart';
import 'package:hamo_dashboard/widgets/upload_image.dart';
import 'package:hamo_dashboard/controllers/add_banner_controller.dart';

class AddBannerScreen extends StatelessWidget {
  AddBannerScreen({super.key});

  final AddBannerController addBannerController = Get.put(
    AddBannerController(),
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
                    Text('Add Banner', style: TextStyles.font26PrimaryMedium),
                    const Spacer(),
                  ],
                ),
                verticalSpace(40),
                CustomCard(
                  child: UploadImage(
                        labelText: 'Category Cover Image',
                        imagePath: (bytes) {
                          addBannerController.banner = bytes;
                        },
                      ),
                ),
                verticalSpace(28),
                Obx(
                  () =>
                      addBannerController.isLoading.value == false
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
                                  if (addBannerController
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    addBannerController.uploadCover();
                                  }
                                },
                              ),
                            ],
                          )
                          : CircularProgressIndicator(
                            color: ColorsManager.primary,
                          ),
                ),
                if (addBannerController.isAdded.value)
                  Text(
                    'The Category added Successfully',
                    style: TextStyles.font18PrimaryMedium,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
