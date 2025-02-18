import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/styles.dart';

DataColumn headerCell({required String text}) => DataColumn(
      label: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.font16TextBold,
      ),
      tooltip: text,
    );
