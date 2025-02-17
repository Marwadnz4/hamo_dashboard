import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/colors.dart';

class TextStyles {
  static TextStyle font20LabelRegular = TextStyle(
    color: ColorsManager.label,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font20HintRegular = TextStyle(
    color: Colors.purpleAccent,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font20RedRegular = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font14PrefixRegular = TextStyle(
    color: ColorsManager.label,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font26PrimaryMedium = TextStyle(
    color: ColorsManager.primary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font18WhiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font28WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20WhiteMedium = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font18PrimaryMedium = TextStyle(
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

  static TextStyle font18BlueRegular = TextStyle(
    color: Colors.blue,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font18BlueRegularUnderline = TextStyle(
    color: Colors.blue,
    fontSize: 18,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
  );

  static TextStyle font22PrimaryMedium = TextStyle(
    color: ColorsManager.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font22RedMedium = TextStyle(
    color: Colors.red,
    fontSize: 2216,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font60WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font30DarkBlueBold = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font30BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font30MainDarkBlue = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20DarkBlue = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font25LightYellow = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font30WhiteRegular = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font30BoldDarkBlue = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20BoldDarkBlue = TextStyle(
    color: ColorsManager.text,
    fontSize: 16,
    fontWeight: FontWeight.bold,
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
