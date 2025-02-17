import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorsManager.primary,
          size: 25,
        ),
      ),
    );
  }
}
