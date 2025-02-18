import 'package:get/get.dart';
import 'package:hamo_dashboard/firebase/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/services_response.dart';

class GetServicesController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void onInit() {
    super.onInit();
    getServices();
  }

  List<ServiceResponse> services = [];
  RxBool isLoading = true.obs;

  void getServices() async {
    isLoading.value = true;
    services = [];

    try {
      var result = await _firebaseService.getServices();
      services.addAll(result);
      isLoading.value = false;
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
      isLoading.value = false;
    } on Exception catch (errMessage) {
      print(errMessage.toString());
      isLoading.value = false;
    }
  }

  void deleteService(ServiceResponse service) async {
    try {
      await _firebaseService.deleteService(service.serviceDocId);
      print('Service Deleted Successfully');
      getServices();
    } on firebase_core.FirebaseException catch (e) {
      print(e.message ?? 'Service Not Deleted');
    } on Exception catch (errMessage) {
      print(errMessage.toString());
    }
  }
}
