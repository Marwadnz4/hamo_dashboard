import 'package:flutter/material.dart';

DataCell deleteCell({
  required Function()? onTap,
}) =>
    DataCell(
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.delete_outline_rounded,
            size: 25,
            color: Colors.red,
          ),
        ),
      ),
    );
