import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/constants.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/delete_cell.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/header_cell.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/image_cell.dart';
import 'package:hamo_dashboard/view_models/get_banners_controller.dart';

class BannersTable extends StatelessWidget {
  final GetBannersController getBannersController;

  const BannersTable({super.key, required this.getBannersController});

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
        DashboardTablesHeaderRow.bannersHeaderRow.length,
        (index) =>
            headerCell(text: DashboardTablesHeaderRow.bannersHeaderRow[index]),
      ),
      rows: List.generate(
        getBannersController.banners.length,
        (index) => DataRow(
          color: WidgetStatePropertyAll(
            index % 2 == 0 ? Colors.white : ColorsManager.background,
          ),
          cells: [
            imageCell(
              context: context,
              image: getBannersController.banners[index].cover,
            ),
            deleteCell(
              onTap: () {
                getBannersController.deleteBanner(
                  getBannersController.banners[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
