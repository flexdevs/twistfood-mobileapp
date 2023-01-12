import 'package:flutter/material.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:twist_food/views/auth_screens/widgets/google_button.dart';
import 'package:twist_food/views/auth_screens/widgets/login_button.dart';
import 'package:twist_food/views/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            CustomTextFormField(hintText: 'Email'),
            SizedBox(height: 12.0),
            CustomTextFormField(hintText: 'Password'),
            SizedBox(height: 12.0),
            Text('Or Continue With',
                style: TwistStyles.w600.copyWith(fontSize: 12.0)),
            SizedBox(height: 20.0),
            GoogleButton(),
            SizedBox(height: 20.0),
            Text(
              'Forgot Your Password?',
              style: TwistStyles.w400
                  .copyWith(fontSize: 14.0, color: TwistColor.primaryColor),
            ),
            SizedBox(height: 36.0),
            LoginButton(
              onTap: () {},
              textButton: 'Login',
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              },
              child: Text(
                "don't have an account?",
                style: TwistStyles.w400
                    .copyWith(fontSize: 14.0, color: TwistColor.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
