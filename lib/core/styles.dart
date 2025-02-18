import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';

class TextStyles {
  static TextStyle font16LabelRegular = TextStyle(
    color: ColorsManager.label,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font14HintRegular = TextStyle(
    color: Colors.purpleAccent,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font16RedRegular = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font18PrimaryMedium = TextStyle(
    color: ColorsManager.primary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14WhiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14PrimaryMedium = TextStyle(
    color: ColorsManager.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16TextBold = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font16TextMedium = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14BlueRegular = TextStyle(
    color: Colors.blue,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

class TextFormFieldBorders {
  static OutlineInputBorder focusedBorderForAppField = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.stroke, width: 1),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder errorBorderForAppField = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder focusedBorderForPhoneField = OutlineInputBorder(
    borderSide: BorderSide(color: ColorsManager.stroke, width: 1),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );

  static OutlineInputBorder errorBorderForPhoneField = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );

  static OutlineInputBorder stateBorderInCell = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(40),
  );

  static OutlineInputBorder stateBorderInForm = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(8),
  );
}
