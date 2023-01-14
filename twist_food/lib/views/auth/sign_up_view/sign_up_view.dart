// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twist_food/data/services/api/secure_api_service.dart/secure_api_service.dart';
import 'package:twist_food/routes/routes.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/helper.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/widgets/login_button.dart';
import 'package:twist_food/views/widgets/custom_text_fields.dart';
import 'package:twist_food/views/widgets/phone_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Image.asset(
              TwistIcons.logo,
              height: 139.0,
              width: 175.0,
            ),
            Text(
              'TwistFood',
              style: TwistStyles.w600.copyWith(
                fontSize: 40.0,
                color: TwistColor.primaryColor,
              ),
            ),
            const Text(
              'Deliever Favorite Food',
              style: TwistStyles.w500,
            ),
            SizedBox(
              height: 60.0,
            ),
            const Text('Sign Up', style: TwistStyles.w600),
            SizedBox(
              height: 20.0,
            ),
            CustomTextFormField(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset(TwistIcons.person),
              ),
              hintText: 'Name',
              keyboardType: TextInputType.text,
              controller: nameController,
            ),
            SizedBox(
              height: 12.0,
            ),
            PhoneTextFormField(
              icon: Text(
                ' +998 ',
                style: TwistStyles.w500.copyWith(fontSize: 16.0),
              ),
              hintText: '** *** ** **',
              keyboardType: TextInputType.phone,
              phoneController: phoneController,
            ),
            SizedBox(
              height: 20.0,
            ),
            LoginButton(
              onTap: () async {
                if (nameController.text.isEmpty ||
                    phoneController.text.isEmpty) {
                  Helper.showTopSnackbarError(
                      context: context, message: 'Please fill fields');
                  return;
                }
                await sendCodeToPhone(context);
              },
              textButton: 'Create Account',
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Get.offNamed(TwistRoutes.getLoginRoute()),
              child: Text(
                "Do you have already an account?",
                style: TwistStyles.w400.copyWith(
                  fontSize: 14.0,
                  color: TwistColor.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendCodeToPhone(BuildContext context) async {
    await apiService
        .sendCodeToPhone(
      phoneNumber: phoneController.text.replaceAll(' ', ''),
      context: context,
    )
        .then((value) {
      if (value) {
        Get.toNamed(
          TwistRoutes.getVerifyView(),
          arguments: [
            phoneController.text,
            false,
            nameController.text,
          ],
        );
      }
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
