import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/helpers/spacing.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/widgets/table_cells/address_cell.dart';
import 'package:hamo_dashboard/models/booker_response.dart';
import 'package:intl/intl.dart';

DataCell bookersCell({
  required List<BookerResponse> bookers,
  required BuildContext context,
}) => DataCell(
  InkWell(
    onTap: () => showBookersDialog(bookers: bookers, context: context),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Text('Bookers', style: TextStyles.font18BlueRegular),
    ),
  ),
);

Future<dynamic> showBookersDialog({
  required List<BookerResponse> bookers,
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    useRootNavigator: true,
    builder:
        (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 400),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bookers :', style: TextStyles.font26PrimaryMedium),
                  verticalSpace(5),
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      itemBuilder:
                          (context, index) => Card(
                            color: ColorsManager.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bookers[index].userName,
                                    style: TextStyles.font28WhiteBold,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat.yMMMd().format(
                                          bookers[index].beingDate,
                                        ),
                                        style: TextStyles.font28WhiteBold
                                            .copyWith(
                                              color: Colors.greenAccent,
                                            ),
                                      ),
                                      Text(
                                        DateFormat.yMMMd().format(
                                          bookers[index].endDate,
                                        ),
                                        style: TextStyles.font28WhiteBold
                                            .copyWith(
                                              color: Colors.greenAccent,
                                            ),
                                      ),

                                      InkWell(
                                        onTap: () {
                                          showMapDialog(
                                            context,
                                            bookers[index].location,
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            size: 25,
                                            color: ColorsManager.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(5),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => verticalSpace(10),
                      itemCount: bookers.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
