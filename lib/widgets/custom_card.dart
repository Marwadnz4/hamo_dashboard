import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorsManager.stroke,
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
