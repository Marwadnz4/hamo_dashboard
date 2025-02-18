import 'package:flutter/material.dart';

DataCell serviceStatusCell({
  required Widget child,
}) =>
    DataCell(
      Padding(
        padding: EdgeInsets.all(8),
        child: child,
      ),
    );
