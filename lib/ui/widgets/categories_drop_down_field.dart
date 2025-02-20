import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/view_models/add_service_controller.dart';
import 'package:hamo_dashboard/view_models/get_categories_controller.dart';
import 'package:hamo_dashboard/models/category_response.dart';

class CategoriesDropdownField extends StatefulWidget {
  const CategoriesDropdownField({super.key, required this.selectedCategory});

  final void Function(CategoryResponse?) selectedCategory;

  @override
  State<CategoriesDropdownField> createState() =>
      _CategoriesDropdownFieldState();
}

class _CategoriesDropdownFieldState extends State<CategoriesDropdownField> {
  CategoryResponse? categoryResponse;
  final GetCategoriesController getCategoriesController = Get.put(
    GetCategoriesController(),
  );
  final AddServiceController addServiceController = Get.find();

  @override
  void initState() {
    super.initState();
    addServiceController.category = getCategoriesController.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    categoryResponse = getCategoriesController.categories.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Category', style: TextStyles.font16LabelRegular),
        verticalSpace(13),
        DropdownButtonFormField<CategoryResponse>(
          validator: (value) {
            if (value == null) {
              return "Select thing";
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: TextFormFieldBorders.focusedBorderForAppField,
            focusedBorder: TextFormFieldBorders.focusedBorderForAppField,
            enabledBorder: TextFormFieldBorders.focusedBorderForAppField,
          ),
          value: getCategoriesController.categories.first,
          borderRadius: BorderRadius.circular(8),
          items:
              getCategoriesController.categories
                  .map(
                    (item) => DropdownMenuItem<CategoryResponse>(
                      value: item,
                      child: Text(
                        item.categoryName,
                        style: TextStyles.font16LabelRegular,
                      ),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            setState(() {
              categoryResponse = value!;
            });
            widget.selectedCategory(
              categoryResponse ?? getCategoriesController.categories.first,
            );
          },
        ),
      ],
    );
  }
}
