import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/forgot_pass_view/forgot_pass_view.dart';
import 'package:twist_food/views/auth/sign_up_view/sign_up_view.dart';
import 'package:twist_food/views/auth/verify_view/verify_view.dart';
import 'package:twist_food/views/auth/widgets/google_button.dart';
import 'package:twist_food/views/auth/widgets/login_button.dart';
import 'package:twist_food/views/widgets/phone_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
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
            SizedBox(height: 10.0),
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
            SizedBox(height: 40.0),
            PhoneTextFormField(
              icon: Text(' +998 ',
                  style: TwistStyles.w500.copyWith(fontSize: 16.0)),
              hintText: '** *** ** **',
              keyboardType: TextInputType.phone,
              phoneController: phoneController,
            ),
            SizedBox(height: 20.0),
            Text('Or Continue With',
                style: TwistStyles.w600.copyWith(fontSize: 12.0)),
            SizedBox(height: 20.0),
            GoogleButton(),
            SizedBox(height: 20.0),
            // GestureDetector(
            //   onTap: () {
            //     print("object");
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ForgotPasswordView(),
            //       ),
            //     );
            //   },
            //   child: Text(
            //     'Forgot Your Password?',
            //     style: TwistStyles.w400
            //         .copyWith(fontSize: 14.0, color: TwistColor.primaryColor),
            //   ),
            // ),
            SizedBox(height: 36.0),
            LoginButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifiyScreen(
                        phoneNumber: phoneController.text,
                      ),
                    ));
              },
              textButton: 'Login',
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
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
}
