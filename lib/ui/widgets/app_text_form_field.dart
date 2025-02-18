import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    required this.labelText,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.maxLines,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyles.font16LabelRegular),
        verticalSpace(13),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          cursorColor: ColorsManager.primary,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            focusedBorder: TextFormFieldBorders.focusedBorderForAppField,
            enabledBorder: TextFormFieldBorders.focusedBorderForAppField,
            errorBorder: TextFormFieldBorders.errorBorderForAppField,
            focusedErrorBorder: TextFormFieldBorders.errorBorderForAppField,
            hintText: hintText,
            hintStyle: TextStyles.font16LabelRegular,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints.tight(Size(80, 80)),
            prefixStyle: TextStyles.font16LabelRegular,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font16LabelRegular,
          validator: validator,
        ),
      ],
    );
  }
}
