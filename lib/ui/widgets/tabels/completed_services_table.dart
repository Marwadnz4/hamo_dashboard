import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/constants.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/bookers_cell.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/header_cell.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/image_cell.dart';
import 'package:hamo_dashboard/ui/widgets/table_cells/normal_cell.dart';
import 'package:hamo_dashboard/view_models/booked_services_controller.dart';
import 'package:hamo_dashboard/models/services_response.dart';

class CompletedServicesTable extends StatelessWidget {
  final BookedServicesController bookedServicesController;

  const CompletedServicesTable({super.key, required this.bookedServicesController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 30,
        border: TableBorder.all(
          borderRadius: BorderRadius.circular(8),
          color: ColorsManager.stroke,
          width: 1,
        ),
        headingRowColor: const WidgetStatePropertyAll(ColorsManager.background),
        columns: List.generate(
          DashboardTablesHeaderRow.bookedServicesHeaderRow.length,
          (index) => headerCell(
            text: DashboardTablesHeaderRow.bookedServicesHeaderRow[index],
          ),
        ),
        rows: List.generate(
          bookedServicesController.completedServices.length,
          (index) {
            ServiceResponse service = bookedServicesController.completedServices[index];
            return DataRow(
            color: WidgetStatePropertyAll(
              index % 2 == 0 ? Colors.white : ColorsManager.background,
            ),
            cells: [
            normalCell(text: service.serviceName),
              normalCell(text: service.servicePresenter),
              normalCell(text: service.servicePrice.toString()),
              imageCell(context: context, image: service.cover),
              normalCell(text: service.category.categoryName),
              normalCell(text: 'Completed'),
              bookersCell(bookers: service.bookers, context: context),
            ],
          );
          },
        ),
      ),
    );
  }
}
