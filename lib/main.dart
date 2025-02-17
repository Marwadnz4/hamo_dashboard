import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamo_dashboard/core/helpers/constants.dart';
import 'package:hamo_dashboard/core/helpers/shared_pref_helper.dart';
import 'package:hamo_dashboard/hamo_dashboard_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfLoggedInUser();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(HamoDashboard());
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.uid,
  );
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
