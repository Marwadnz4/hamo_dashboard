import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/controllers/add_service_controller.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';
import 'package:hamo_dashboard/widgets/app_button_with_icon.dart';
import 'package:hamo_dashboard/widgets/custom_divider.dart';

class UploadMultiImagesBtn extends StatefulWidget {
  const UploadMultiImagesBtn({super.key});

  @override
  State<UploadMultiImagesBtn> createState() => _UploadMultiImagesBtnState();
}

class _UploadMultiImagesBtnState extends State<UploadMultiImagesBtn> {
  bool imageAvailable = false;
  final AddServiceController addServiceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text('Product Images', style: TextStyles.font20LabelRegular),
        ),
        verticalSpace(13),
        addServiceController.images.isEmpty
            ? InkWell(
              onTap: () async {
                List<Uint8List>? bytesFromPicker =
                    await ImagePickerWeb.getMultiImagesAsBytes();

                setState(() {
                  imageAvailable = true;
                });
                if (bytesFromPicker != null) {
                  addServiceController.images.addAll(bytesFromPicker);
                }
              },
              child: SizedBox(
                height: 394,
                child: const CustomUploadMultiImagesBtn(),
              ),
            )
            : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorsManager.navSelector,
                        width: 2,
                      ),
                    ),
                    height: 394,
                    child: ListView.separated(
                      padding: EdgeInsets.all(4),
                      itemBuilder:
                          (context, index) => Image.memory(
                            addServiceController.images[index],
                            fit: BoxFit.fill,
                          ),
                      separatorBuilder:
                          (context, index) => const CustomDivider(),
                      itemCount: addServiceController.images.length,
                    ),
                  ),
                ),
                horizontalSpace(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Uploaded Images number : ${addServiceController.images.length}',
                      style: TextStyles.font22PrimaryMedium,
                    ),
                    verticalSpace(50),
                    InkWell(
                      onTap: () async {
                        List<Uint8List>? bytesFromPicker =
                            await ImagePickerWeb.getMultiImagesAsBytes();

                        setState(() {});
                        if (bytesFromPicker != null) {
                          addServiceController.images.addAll(bytesFromPicker);
                        }
                      },
                      child: const CustomUploadMultiImagesBtn(),
                    ),
                    verticalSpace(50),
                    AppButtonWithIcon(
                      buttonText: 'Clear All',
                      icon: Icons.clear_all_outlined,
                      width: 200,
                      onPressed: () {
                        setState(() {
                          addServiceController.images.clear();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
        if (addServiceController.images.isEmpty) verticalSpace(20),
        if (addServiceController.images.isEmpty)
          Text(
            'You should upload product images',
            style: TextStyles.font20RedRegular,
          ),
      ],
    );
  }
}

class CustomUploadMultiImagesBtn extends StatelessWidget {
  const CustomUploadMultiImagesBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: ColorsManager.label,
      strokeCap: StrokeCap.round,
      strokeWidth: 1,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: ColorsManager.primary,
              child: Icon(Icons.add, color: Colors.white, size: 45),
            ),
            horizontalSpace(20),
            Text('Upload Images', style: TextStyles.font26PrimaryMedium),
          ],
        ),
      ),
    );
  }
}
