import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sarang_app/src/common_widget/banner_widget.dart';
import 'package:sarang_app/src/common_widget/custom_button_widget.dart';
import 'package:sarang_app/src/common_widget/custom_textfield_widget.dart';
import 'package:sarang_app/src/common_widget/hero_widget.dart';
import 'package:sarang_app/src/common_widget/logo_and_tagline_widget.dart';
import 'package:sarang_app/src/common_widget/logo_widget.dart';
import 'package:sarang_app/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang_app/src/theme_manager/values_manager.dart';
import 'package:sarang_app/src/common_widget/custom_text_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  String? validationInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return 'Name or Email or Password can\'t be empty';
    }
    if (nameController.text.length < 4 ||
        emailController.text.length < 4 ||
        passwordController.text.length < 4) {
      return 'Too short, minimum 4 character';
    }
    if (!emailController.text.contains('@')) {
      return 'Email Invalid';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p50, horizontal: AppPadding.p24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(),
              CustomTextFieldWidget(
                  labelName: 'Complete Name',
                  hintext: 'Write your name',
                  controller: nameController),
              CustomTextFieldWidget(
                  labelName: 'Email Address',
                  hintext: 'Write your email address',
                  controller: emailController),
              CustomTextFieldWidget(
                labelName: 'Password',
                hintext: 'Write your security',
                controller: passwordController,
                isObsecure: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              CustomButtonWidget(
                title: 'Get Started',
                onTap: () {
                  final message = validationInput();
                  if (message != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpAgeJobScreen(
                            fullname: nameController.text,
                            email: emailController.text,
                            password: passwordController.text),
                      ));
                },
              ),
              SizedBox(height: 20.0),
              CustomTextButtonWidget(
                  title: 'Sign In to My Account', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
