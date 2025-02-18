import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/ui/widgets/spacing.dart';
import 'package:hamo_dashboard/core/styles.dart';
import 'package:hamo_dashboard/ui/widgets/custom_card.dart';
import 'package:hamo_dashboard/view_models/booked_services_controller.dart';
import 'package:hamo_dashboard/ui/widgets/tabels/canceled_services_table.dart';
import 'package:hamo_dashboard/ui/widgets/tabels/completed_services_table.dart';
import 'package:hamo_dashboard/ui/widgets/tabels/upcoming_services_table.dart';

class BookedServicesScreen extends StatefulWidget {
  const BookedServicesScreen({super.key});

  @override
  State<BookedServicesScreen> createState() => _BookedServicesScreenState();
}

class _BookedServicesScreenState extends State<BookedServicesScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int initialIndex = 0;
  List<String> tabs = ['Upcoming', 'Completed', 'Cenceled'];

  @override
  initState() {
    tabController = TabController(
      length: tabs.length,
      initialIndex: initialIndex,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BookedServicesController bookedServicesController = Get.put(
      BookedServicesController(),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Booked Services', style: TextStyles.font18PrimaryMedium),
              IconButton(
                onPressed: () {
                  bookedServicesController.getBookedServices();
                },
                icon: Icon(
                  Icons.refresh,
                  color: ColorsManager.primary,
                  size: 25,
                ),
              ),
            ],
          ),
          TabBar(
            controller: tabController,
            labelColor: ColorsManager.primary,
            unselectedLabelColor: ColorsManager.label,
            indicatorColor: ColorsManager.primary,
            tabs:
                tabs
                    .map(
                      (tab) => Tab(
                        key: Key(tab),
                        child: Text(tab, style: TextStyles.font18PrimaryMedium),
                      ),
                    )
                    .toList(),
          ),
          verticalSpace(40),

          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CustomCard(
                child: Obx(
                  () =>
                      bookedServicesController.isGetAllServices.value
                          ? TabBarView(
                            controller: tabController,

                            children: [
                              UpcomingServicesTable(
                                bookedServicesController:
                                    bookedServicesController,
                              ),
                              CompletedServicesTable(
                                bookedServicesController:
                                    bookedServicesController,
                              ),
                              CanceledServicesTable(
                                bookedServicesController:
                                    bookedServicesController,
                              ),
                            ],
                          )
                          : Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.primary,
                            ),
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
