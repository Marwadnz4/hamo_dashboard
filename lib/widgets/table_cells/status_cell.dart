import 'package:flutter/material.dart';

DataCell productStateCell({
  required Widget child,
}) =>
    DataCell(
      Padding(
        padding: EdgeInsets.all(8),
        child: child,
      ),
    );
