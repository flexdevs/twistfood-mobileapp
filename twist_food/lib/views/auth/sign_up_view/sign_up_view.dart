// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:twist_food/data/services/api/secure_api_service.dart/secure_api_service.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/sign_in_view/sign_in_view.dart';
import 'package:twist_food/views/auth/verify_view/verify_view.dart';
import 'package:twist_food/views/auth/widgets/login_button.dart';
import 'package:twist_food/views/widgets/custom_text_fields.dart';
import 'package:twist_food/views/widgets/phone_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  showTopSnackBar(
                    Overlay.of(context)!,
                    CustomSnackBar.error(message: 'Please fill fields'),
                  );
                  return;
                }
                await sendCodeToPhone(context);
              },
              textButton: 'Create Account',
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifiyScreen(
              phoneNumber: phoneController.text,
              userName: nameController.text,
              toLogin: false,
            ),
          ),
        );
      } else {
        showTopSnackBar(
          Overlay.of(context)!,
          CustomSnackBar.error(message: 'Something get error'),
        );
      }
    });
  }
}
