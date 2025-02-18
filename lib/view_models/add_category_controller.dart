import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/models/storage_image_model.dart';
import 'package:hamo_dashboard/firebase/firebase_constants.dart';
import 'package:hamo_dashboard/firebase/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/category_request_body.dart';

class AddCategoryController extends GetxController {
  TextEditingController categoryNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseService _firebaseService = FirebaseService();
  Uint8List? bytes;
  String? subFolderName;
  RxBool isLoading = false.obs;
  RxBool isAdded = false.obs;

  void uploadCover() async {
    isLoading.value = true;
    subFolderName =
        '${categoryNameController.text}${DateTime.now().microsecondsSinceEpoch}';

    if (bytes != null) {
      String coverUrl = '';
      try {
        coverUrl = await _firebaseService.uploadImageToFirestorage(
          StorageImageModel(
            subFolderName: subFolderName!,
            file: bytes!,
            folderName: FirebaseConstants.categories,
            imageName: categoryNameController.text.trim(),
          ),
        );
        await addCategory(coverUrl);
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'The cover not uploaded');
      } on Exception catch (errMessage) {
        print(errMessage.toString());
      }
    }
  }

  Future<void> addCategory(String coverUrl) async {
    if (coverUrl.isNotEmpty) {
      try {
        await _firebaseService.addCategory(
          CategoryRequestBody(
            categoryName: categoryNameController.text.trim(),
            cover: coverUrl,
            folderNameInFirebaseStorage: subFolderName!,
          ),
        );
        clearFields();
        isAdded.value = true;
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'Category Not Added');
      } catch (e) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }

  void clearFields(){
    categoryNameController.clear();
    bytes = null;
    subFolderName = null;
    isAdded.value = false;
  }
}
