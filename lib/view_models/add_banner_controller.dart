import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:hamo_dashboard/models/storage_image_model.dart';
import 'package:hamo_dashboard/firebase/firebase_constants.dart';
import 'package:hamo_dashboard/firebase/firebase_service.dart';
import 'package:hamo_dashboard/models/banner_request_body.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AddBannerController extends GetxController {
  FirebaseService _firebaseService = FirebaseService();
  Uint8List? banner;
  String? subFolderName;
  RxBool isLoading = false.obs;
  RxBool isAdded = false.obs;

  void uploadCover() async {
    isLoading.value = true;
    subFolderName = '${DateTime.now().microsecondsSinceEpoch}';

    if (banner != null) {
      String coverUrl = '';
      try {
        coverUrl = await _firebaseService.uploadImageToFirestorage(
          StorageImageModel(
            subFolderName: subFolderName!,
            file: banner!,
            folderName: FirebaseConstants.banners,
            imageName: 'banner',
          ),
        );
        await addBanner(coverUrl);
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'The cover not uploaded');
      } on Exception catch (errMessage) {
        print(errMessage.toString());
      }
    }
  }

  Future<void> addBanner(String coverUrl) async {
    if (coverUrl.isNotEmpty) {
      try {
        await _firebaseService.addBanner(
          BannerRequestBody(
            cover: coverUrl,
            folderNameInFirebaseStorage: subFolderName!,
          ),
        );
        isAdded.value = true;
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'Banner Not Added');
      } catch (e) {
        print(e.toString());
      }
      isLoading.value = false;
    }
  }
}
