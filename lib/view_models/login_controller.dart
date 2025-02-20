import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/shared_pref_helper.dart';
import 'package:hamo_dashboard/firebase/firebase_service.dart';
import 'package:hamo_dashboard/route/app_routes.dart';
import 'package:hamo_dashboard/models/admin_response.dart';
import 'package:hamo_dashboard/models/login_request_body.dart';

class LoginController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    try {
      UserCredential credential = await _firebaseService.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      await getAdminInfo(credential);

      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.message ?? 'Check your internet connection');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAdminInfo(UserCredential admin) async {
    isLoading.value = true;

    try {
      DocumentSnapshot<Map<String, dynamic>>? doc = await _firebaseService
          .getAdminInfo(admin: admin);
      if (doc != null) {
        AdminResponse adminResponse = AdminResponse.fromJson(doc.data()!);
        await saveUserToken(adminResponse.uid);
        isLoading.value = false;
        Get.toNamed(AppRoutes.navigationBarScreen);
        print(adminResponse);
      }
      print('you are not admin');
    } on FirebaseException catch (e) {
      isLoading.value = false;
      print(e.message ?? 'you are not admin');
    } on Exception catch (errMessage) {
      isLoading.value = false;
      print(errMessage.toString());
    }
  }
}

Future<void> saveUserToken(String uid) async {
  await SharedPrefHelper.setSecuredString('uid', uid);
}
