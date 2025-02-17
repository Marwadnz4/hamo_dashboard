import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/helpers/constants.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/widgets/table_cells/delete_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/header_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/image_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/normal_cell.dart';
import 'package:hamo_dashboard/controllers/get_categories_controller.dart';

class CategoriesTable extends StatelessWidget {
  final GetCategoriesController getCategoriesController;

  const CategoriesTable({super.key, required this.getCategoriesController});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 30,
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(8),
        color: ColorsManager.stroke,
        width: 1,
      ),
      headingRowColor: const WidgetStatePropertyAll(ColorsManager.background),
      columns: List.generate(
        DashboardTablesHeaderRow.categoriesHeaderRow.length,
        (index) => headerCell(
          text: DashboardTablesHeaderRow.categoriesHeaderRow[index],
        ),
      ),
      rows: List.generate(
        getCategoriesController.categories.length,
        (index) => DataRow(
          // selected: ,
          color: WidgetStatePropertyAll(
            index % 2 == 0 ? Colors.white : ColorsManager.background,
          ),
          cells: [
            normalCell(
              text: getCategoriesController.categories[index].categoryName,
            ),
            imageCell(
              context: context,
              image: getCategoriesController.categories[index].cover,
            ),
            deleteCell(
              onTap: () {
                getCategoriesController.deleteCategory(
                  getCategoriesController.categories[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
