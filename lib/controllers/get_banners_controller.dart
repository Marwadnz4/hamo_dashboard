import 'package:get/get.dart';
import 'package:hamo_dashboard/core/networking/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/banner_response.dart';

class GetBannersController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void onInit() {
    super.onInit();
    getBanners();
  }

  List<BannerResponse> banners = [];
  RxBool isLoading = true.obs;

  void getBanners() async {
    isLoading.value = true;

    try {
      var result = await _firebaseService.getBanners();
      banners.addAll(result);
      isLoading.value = false;
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
      isLoading.value = false;
    } on Exception catch (errMessage) {
      print(errMessage.toString());
      isLoading.value = false;
    }
  }

  void deleteBanner(BannerResponse banner) async {
    try {
      await _firebaseService.deleteBanner(banner.bannerDocId);
      print('Banner Deleted Successfully');
      getBanners();
    } on firebase_core.FirebaseException catch (e) {
      print(e.message ?? 'Banner Not Deleted');
    } on Exception catch (errMessage) {
      print(errMessage.toString());
    }
  }
}
