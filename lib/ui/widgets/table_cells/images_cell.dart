import 'package:flutter/material.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';

DataCell imagesCell({
  required List<String> images,
  required BuildContext context,
}) =>
    DataCell(
      InkWell(
        onTap: () => showImagesDialog(context, images),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyles.font18BlueRegular,
          ),
        ),
      ),
    );

Future<dynamic> showImagesDialog(BuildContext context, List<String> images) {
  return showDialog(
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 300),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (context, index) => SizedBox(
              height: 300,
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: images[index],
                fit: BoxFit.fill,
              ),
            ),
            separatorBuilder: (context, index) => verticalSpace(20),
            itemCount: images.length,
          ),
        ),
      ),
    ),
  );
}
