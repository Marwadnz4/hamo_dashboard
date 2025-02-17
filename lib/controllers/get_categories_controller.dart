import 'package:get/get.dart';
import 'package:hamo_dashboard/core/networking/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/category_response.dart';

class GetCategoriesController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  List<CategoryResponse> categories = [];
  RxBool isLoading = true.obs;

  void getCategories() async {
    isLoading.value = true;

    try {
      var result = await _firebaseService.getCategories();
      categories.addAll(result);
      isLoading.value = false;
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
      isLoading.value = false;
    } on Exception catch (errMessage) {
      print(errMessage.toString());
      isLoading.value = false;
    }
  }

  void deleteCategory(CategoryResponse category) async {
    try {
      await _firebaseService.deleteCategory(category.categoryDocId);
      print('Category Deleted Successfully');
      getCategories();
    } on firebase_core.FirebaseException catch (e) {
      print(e.message ?? 'Category Not Deleted');
    } on Exception catch (errMessage) {
      print(errMessage.toString());
    }
  }
}
