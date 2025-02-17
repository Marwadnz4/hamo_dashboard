import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamo_dashboard/core/colors.dart';
import 'package:hamo_dashboard/widgets/spacing.dart';
import 'package:hamo_dashboard/widgets/app_button.dart';
import 'package:hamo_dashboard/widgets/app_text_form_field.dart';
import 'package:hamo_dashboard/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  bool isObscureText = true;
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/white_logo.png', height: 200),
            verticalSpace(20),
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: loginController.emailController,
                        hintText: "Insert Email",
                        labelText: "Admin Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid Admin Email';
                          }
                          return null;
                        },
                      ),
                      verticalSpace(25),
                      AppTextFormField(
                        controller: loginController.passwordController,
                        hintText: "Insert Password",
                        labelText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 25,
                          ),
                        ),
                      ),
                      verticalSpace(30),
                      Obx(
                        () =>
                            loginController.isLoading.value
                                ? const CircularProgressIndicator(
                                  color: ColorsManager.primary,
                                )
                                : Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 100,
                                  ),
                                  child: AppButton(
                                    buttonText: 'Login',
                                    onPressed: () {
                                      if (loginController.formKey.currentState!
                                          .validate()) {
                                        loginController.login();
                                      }
                                    },
                                  ),
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
