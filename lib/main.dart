import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/constants.dart';
import 'package:hamo_dashboard/core/shared_pref_helper.dart';
import 'package:hamo_dashboard/hamo_dashboard_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(HamoDashboard());
}

checkIfLoggedInUser() async {
  String? userUid = await SharedPrefHelper.getSecuredString('uid');
  if (userUid != null && userUid.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
