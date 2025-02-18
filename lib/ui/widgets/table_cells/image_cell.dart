import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/styles.dart';

DataCell imageCell({
  required String image,
  required BuildContext context,
}) =>
    DataCell(
      InkWell(
        onTap: () => showImagesDialog(context, image),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: FittedBox(
            child: Text(
              'View',
              style: TextStyles.font18BlueRegular,
            ),
          ),
        ),
      ),
    );

Future<dynamic> showImagesDialog(BuildContext context, String image) {
  return showDialog(
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 400),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            height: 400,
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/images/loading.gif',
              image: image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  );
}
