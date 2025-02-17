import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/helpers/constants.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/widgets/table_cells/address_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/delete_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/header_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/image_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/images_cell.dart';
import 'package:hamo_dashboard/widgets/table_cells/normal_cell.dart';
import 'package:hamo_dashboard/controllers/get_services_controller.dart';
import 'package:hamo_dashboard/models/services_response.dart';

class ServicesTable extends StatelessWidget {
  final GetServicesController getServicesController;

  const ServicesTable({super.key, required this.getServicesController});

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
        DashboardTablesHeaderRow.servicesHeaderRow.length,
        (index) =>
            headerCell(text: DashboardTablesHeaderRow.servicesHeaderRow[index]),
      ),
      rows: List.generate(getServicesController.services.length, (index) {
        ServiceResponse service = getServicesController.services[index];
        return DataRow(
          color: WidgetStatePropertyAll(
            index % 2 == 0 ? Colors.white : ColorsManager.background,
          ),
          cells: [
            normalCell(text: service.serviceName),
            normalCell(text: service.servicePresenter),
            normalCell(text: service.servicePrice.toString()),
            imageCell(context: context, image: service.cover),
            imagesCell(context: context, images: service.images),
            normalCell(text: service.category.categoryName),
            normalCell(text: service.rating.length.toString()),
            addressCell(context: context, address: service.location),
            deleteCell(
              onTap: () {
                getServicesController.deleteService(service);
              },
            ),
          ],
        );
      }),
    );
  }
}
