import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/styles.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool hasBorder;
  final double? width;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.hasBorder = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        side: MaterialStatePropertyAll(hasBorder
            ? const BorderSide(width: 1.5, color: ColorsManager.primary)
            : null),
        elevation: const MaterialStatePropertyAll(2),
        shadowColor: MaterialStatePropertyAll(
            hasBorder ? Colors.grey : ColorsManager.primary),
        backgroundColor: MaterialStatePropertyAll(
          hasBorder ? Colors.white : ColorsManager.primary,
        ),
        padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(width ?? double.maxFinite, 56),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: hasBorder
            ? TextStyles.font18PrimaryMedium
            : TextStyles.font18WhiteMedium,
      ),
    );
  }
}
