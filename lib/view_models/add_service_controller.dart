import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/models/address_model.dart';
import 'package:hamo_dashboard/models/services_request_body.dart';
import 'package:hamo_dashboard/models/storage_image_model.dart';
import 'package:hamo_dashboard/firebase/firebase_constants.dart';
import 'package:hamo_dashboard/firebase/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:hamo_dashboard/models/category_response.dart';
import 'package:hamo_dashboard/models/booker_response.dart';
import 'package:hamo_dashboard/models/services_response.dart';
import 'package:latlong2/latlong.dart';

class AddServiceController extends GetxController {
  FirebaseService _firebaseService = FirebaseService();

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servicePresenterController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Uint8List? cover;
  String? coverUrl;
  List<Uint8List> images = [];
  List<String> imagesUrls = [];
  LatLng location = LatLng(31.4104102, 43.1928213);
  CategoryResponse? category;
  List<ServiceRate> rating = [];
  List<BookerResponse> bookers = [];
  String? subFolderName;
  RxBool isLoading = false.obs;
  RxBool isAdded = false.obs;

  void uploadCover() async {
    isLoading.value = true;
    subFolderName =
        '${serviceNameController.text}${DateTime.now().microsecondsSinceEpoch}';

    if (cover != null && images.isNotEmpty) {
      String url = '';
      try {
        url = await _firebaseService.uploadImageToFirestorage(
          StorageImageModel(
            subFolderName: subFolderName!,
            file: cover!,
            folderName: FirebaseConstants.services,
            imageName: serviceNameController.text.trim(),
          ),
        );
        coverUrl = url;
        if (coverUrl != null) await uploadImages();
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'The cover not uploaded');
      } on Exception catch (errMessage) {
        print(errMessage.toString());
      }
    }
  }

  Future<void> uploadImages() async {
    for (int i = 0; i < images.length; i++) {
      String url = '';
      try {
        url = await _firebaseService.uploadImageToFirestorage(
          StorageImageModel(
            subFolderName: subFolderName!,
            folderName: FirebaseConstants.services,
            file: images[i],
            imageName: serviceNameController.text.trim(),
          ),
        );
        imagesUrls.add(url);
      } on firebase_core.FirebaseException catch (e) {
        print(e.message ?? 'The cover not uploaded');
      } on Exception catch (errMessage) {
        print(errMessage.toString());
      }
    }
    if (imagesUrls.isNotEmpty) {
      imagesUrls.add(coverUrl!);
      await addService();
    }
  }

  Future<void> addService() async {
    try {
      await _firebaseService.addService(
        ServiceRequestBody(
          servicePrice: int.tryParse(servicePriceController.text) ?? 20,
          servicePresenter: servicePresenterController.text,
          serviceName: serviceNameController.text,
          location: AddressModel(
            lat: location.latitude,
            lng: location.longitude,
          ),
          description: descriptionController.text,
          images: imagesUrls,
          category: category!,
          rating: rating,
          bookers: bookers,
          cover: coverUrl!,
        ),
      );
      isAdded.value = true;
      clearAllFields();
    } on firebase_core.FirebaseException catch (e) {
      print(e.message ?? 'Service Not Added');
    } catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
  }

  void clearAllFields() {
    servicePriceController.clear();
    servicePresenterController.clear();
    serviceNameController.clear();
    descriptionController.clear();
    images = [];
    coverUrl = '';
    imagesUrls = [];
  }
}
