import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twist_food/data/services/api/secure_api_service.dart/secure_api_service.dart';
import 'package:twist_food/routes/routes.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/helper.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/widgets/google_button.dart';
import 'package:twist_food/views/auth/widgets/login_button.dart';
import 'package:twist_food/views/widgets/phone_text_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController phoneController = TextEditingController();
  final ApiService apiService = ApiService();
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
            SizedBox(
              height: 10.0,
            ),
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
            SizedBox(height: 60.0),
            const Text('Login To Your Account', style: TwistStyles.w600),
            SizedBox(
              height: 40.0,
            ),
            PhoneTextFormField(
              icon: Text(' +998 ',
                  style: TwistStyles.w500.copyWith(fontSize: 16.0)),
              hintText: '** *** ** **',
              keyboardType: TextInputType.phone,
              phoneController: phoneController,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Or Continue With',
                style: TwistStyles.w600.copyWith(fontSize: 12.0)),
            SizedBox(
              height: 20.0,
            ),
            GoogleButton(),
            SizedBox(
              height: 36.0,
            ),
            LoginButton(
              onTap: () async {
                if (phoneController.text.isEmpty ||
                    phoneController.text.length < 12) {
                  Helper.showTopSnackbarError(
                      context: context, message: 'Please enter correct number');
                  return;
                }

                await apiService
                    .sendCodeToPhone(
                      context: context,
                      phoneNumber: phoneController.text.replaceAll(' ', ''),
                    )
                    .then(
                      (value) => Get.toNamed(
                        TwistRoutes.getVerifyView(),
                        arguments: [
                          phoneController.text,
                          true,
                        ],
                      ),
                    );
              },
              textButton: 'Login',
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(TwistRoutes.getSignUpRoute()),
              child: Text(
                "don't have an account?",
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

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
