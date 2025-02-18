import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/styles.dart';

DataCell normalCell({required String text, String? actualText}) => DataCell(
      Tooltip(
        message: actualText ?? text,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font16TextMedium,
        ),
      ),
    );
