import 'package:get/get.dart';
import 'package:hamo_dashboard/core/networking/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/booker_response.dart';
import 'package:hamo_dashboard/models/services_response.dart';

class BookedServicesController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void onInit() {
    super.onInit();
    getBookedServices();
  }

  List<ServiceResponse> upcomingServices = [];
  List<ServiceResponse> completedServices = [];
  List<ServiceResponse> canceledServices = [];

  RxBool isLoading = true.obs;
  RxBool isGetAllServices = false.obs;

  void getBookedServices() async {
    isLoading.value = true;
    try {
      var result = await _firebaseService.getBookedServices();
      for (int i = 0; i < result.length; i++) {
        for (int j = 0; j < result[i].bookers.length; j++) {
          if (result[i].bookers[j].serviceStatus == BookerStatus.upcoming) {
            upcomingServices.add(result[i]);
          }
          if (result[i].bookers[j].serviceStatus == BookerStatus.completed) {
            completedServices.add(result[i]);
          }
          if (result[i].bookers[j].serviceStatus == BookerStatus.canceled) {
            canceledServices.add(result[i]);
          }
        }
      }
      isLoading.value = false;
      isGetAllServices.value = true;
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
      isLoading.value = false;
    } on Exception catch (errMessage) {
      print(errMessage.toString());
      isLoading.value = false;
    }
  }
}
