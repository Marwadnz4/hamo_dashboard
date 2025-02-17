import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/styles.dart';

class AppButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final VoidCallback onPressed;
  final bool hasBorder;
  final double? width;
  final Color? backgroundColor;

  const AppButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.hasBorder = false,
    this.width,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: hasBorder ? ColorsManager.primary : Colors.white,
        size: 25,
      ),
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        side: MaterialStatePropertyAll(
          hasBorder
              ? const BorderSide(width: 1.5, color: ColorsManager.primary)
              : null,
        ),
        elevation: const MaterialStatePropertyAll(2),
        shadowColor: MaterialStatePropertyAll(
          hasBorder ? Colors.grey : ColorsManager.primary,
        ),
        backgroundColor: MaterialStatePropertyAll(
          hasBorder ? Colors.white : backgroundColor ?? ColorsManager.primary,
        ),
        padding: MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(width ?? double.maxFinite, 56),
        ),
      ),
      onPressed: onPressed,
      label: Text(
        buttonText,
        style:
            hasBorder
                ? TextStyles.font18PrimaryMedium
                : TextStyles.font18WhiteMedium,
      ),
    );
  }
}
