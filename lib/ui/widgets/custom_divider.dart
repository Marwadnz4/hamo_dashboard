import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Divider(
        color: ColorsManager.primary,
        height: 2,
      ),
    );
  }
}
