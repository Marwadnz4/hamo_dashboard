import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/styles.dart';

class ErrorHandlingWidget extends StatelessWidget {
  const ErrorHandlingWidget(this.text,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyles.font22PrimaryMedium,
      ),
    );
  }
}
