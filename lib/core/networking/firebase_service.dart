import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hamo_dashboard/models/banner_response.dart';
import 'package:hamo_dashboard/models/update_service_status_request_body.dart';
import 'package:hamo_dashboard/models/category_request_body.dart';
import 'package:hamo_dashboard/models/category_response.dart';
import 'package:hamo_dashboard/models/services_response.dart';
import 'package:hamo_dashboard/models/storage_image_model.dart';
import 'package:hamo_dashboard/core/networking/firebase_constants.dart';
import 'package:hamo_dashboard/models/banner_request_body.dart';
import 'package:hamo_dashboard/models/login_request_body.dart';
import 'package:hamo_dashboard/models/services_request_body.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Reference _storageRef = FirebaseStorage.instance.ref();

  Future<UserCredential> login(LoginRequestBody loginRequestBody) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );
    return credential;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> getAdminInfo({
    required UserCredential admin,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore
            .collection(FirebaseConstants.admins)
            .doc(admin.user!.uid)
            .get();
    if (doc.exists) {
      return doc;
    }
    return null;
  }

  Future<List<ServiceResponse>> getBookedServices() async {
    List<ServiceResponse> actions = [];
    await _firestore
        .collection(FirebaseConstants.services)
        .where(FirebaseConstants.bookers, isNotEqualTo: [])
        .get()
        .then((querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            actions.add(ServiceResponse.fromJson(docSnapshot.data()));
          }
        });
    return actions;
  }

    Future<void> updateBookingServiceStatus(UpdateServiceStatusRequestBody service) async {
    await _firestore
        .collection(FirebaseConstants.services)
        .doc(service.serviceDocId)
        .update(service.toJson());
  }

  Future<List<BannerResponse>> getBanners() async {
    List<BannerResponse> banners = [];

    await _firestore.collection(FirebaseConstants.banners).get().then((
      querySnapshot,
    ) {
      for (var docSnapshot in querySnapshot.docs) {
        banners.add(BannerResponse.fromJson(docSnapshot.data()));
      }
    });
    return banners;
  }

  Future<void> addBanner(BannerRequestBody banner) async {
    final banners = _firestore.collection(FirebaseConstants.banners);

    DocumentReference<Map<String, dynamic>> doc = await banners.add(
      banner.toJson(),
    );
    await doc.update({'bannerDocId': doc.id});
  }

  Future<void> deleteBanner(String docId) async {
    final banners = _firestore.collection(FirebaseConstants.banners);
    await banners.doc(docId).delete();
  }

  Future<List<CategoryResponse>> getCategories() async {
    List<CategoryResponse> categories = [];

    await _firestore.collection(FirebaseConstants.categories).get().then((
      querySnapshot,
    ) {
      for (var docSnapshot in querySnapshot.docs) {
        categories.add(CategoryResponse.fromJson(docSnapshot.data()));
      }
    });
    return categories;
  }

  Future<String> uploadImageToFirestorage(StorageImageModel image) async {
    String uniqueNumber = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = _storageRef
        .child(image.folderName)
        .child(image.subFolderName)
        .child('${image.imageName}__$uniqueNumber');
    await reference.putData(
      image.file,
      SettableMetadata(contentType: 'image/jpeg'),
    );

    return await reference.getDownloadURL();
  }

  Future<String> uploadImagesToFirestorage(StorageImageModel image) async {
    String uniqueName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference reference = _storageRef
        .child(image.folderName)
        .child(image.subFolderName)
        .child('${image.imageName}$uniqueName');
    await reference.putData(
      image.file,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    return await reference.getDownloadURL();
  }

  Future<void> addCategory(CategoryRequestBody category) async {
    final categories = _firestore.collection(FirebaseConstants.categories);

    DocumentReference<Map<String, dynamic>> doc = await categories.add(
      category.toJson(),
    );
    await doc.update({'categoryDocId': doc.id});
  }

  Future<void> deleteCategory(String docId) async {
    final categories = _firestore.collection(FirebaseConstants.categories);
    await categories.doc(docId).delete();
  }

  Future<List<ServiceResponse>> getServices() async {
    List<ServiceResponse> services = [];

    await _firestore.collection(FirebaseConstants.services).get().then((
      querySnapshot,
    ) {
      for (var docSnapshot in querySnapshot.docs) {
        services.add(ServiceResponse.fromJson(docSnapshot.data()));
      }
    });
    return services;
  }

  Future<void> addService(ServiceRequestBody service) async {
    final services = _firestore.collection(FirebaseConstants.services);
    DocumentReference<Map<String, dynamic>> doc = await services.add(
      service.toJson(),
    );
    await doc.update({'serviceDocId': doc.id});
  }

  Future<void> deleteService(String docId) async {
    final services = _firestore.collection(FirebaseConstants.services);
    await services.doc(docId).delete();
  }
}
