import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({
    super.key,
    required this.imagePath,
    required this.labelText,
  });

  final void Function(Uint8List path) imagePath;
  final String labelText;
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool imageAvailable = false;
  Uint8List? selectedImageInBytes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(widget.labelText, style: TextStyles.font20LabelRegular),
          ),
          verticalSpace(13),
          InkWell(
            onTap: () async {
              final image = await ImagePickerWeb.getImageAsBytes();
              setState(() {
                selectedImageInBytes = image!;
                imageAvailable = true;
              });
              widget.imagePath(selectedImageInBytes!);
            },
            child: SizedBox(
              height: 300,
              child: DottedBorder(
                color: ColorsManager.navSelector,
                strokeCap: StrokeCap.round,
                strokeWidth: 1,
                padding: EdgeInsets.all(10),
                child:
                    imageAvailable
                        ? Image.memory(selectedImageInBytes!, fit: BoxFit.fill)
                        : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: ColorsManager.primary,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              horizontalSpace(20),
                              Text(
                                'Upload Image',
                                style: TextStyles.font26PrimaryMedium,
                              ),
                            ],
                          ),
                        ),
              ),
            ),
          ),
          if (!imageAvailable) verticalSpace(20),
          if (!imageAvailable)
            Text('You should upload cover', style: TextStyles.font20RedRegular),
        ],
      ),
    );
  }
}
