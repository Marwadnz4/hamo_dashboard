import 'package:flutter/material.dart';

class TabModel {
  final IconData icon;
  final String title;
  final Widget screen;

  TabModel({
    required this.icon,
    required this.title,
    required this.screen,
  });
}
