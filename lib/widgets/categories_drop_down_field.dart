import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/controllers/get_categories_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    categoryResponse = getCategoriesController.categories.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Category', style: TextStyles.font20LabelRegular),
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
                        style: TextStyles.font20LabelRegular,
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
