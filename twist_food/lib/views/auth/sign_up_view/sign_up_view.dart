import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twist_food/utils/colors.dart';
import 'package:twist_food/utils/icons.dart';
import 'package:twist_food/utils/styles.dart';
import 'package:twist_food/views/auth/sign_in_view/sign_in_view.dart';
import 'package:twist_food/views/auth/widgets/login_button.dart';
import 'package:twist_food/views/widgets/custom_text_fields.dart';
import 'package:twist_food/views/widgets/phone_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            const Text('Sign Up', style: TwistStyles.w600),
            SizedBox(height: 20.0),
            CustomTextFormField(
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SvgPicture.asset(TwistIcons.person),
              ),
              hintText: 'Name',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 12.0),
            PhoneTextFormField(
              icon: Text(' +998 ',
                  style: TwistStyles.w500.copyWith(fontSize: 16.0)),
              hintText: '** *** ** **',
              keyboardType: TextInputType.phone,
              phoneController: phoneController,
            ),
            SizedBox(height: 20.0),
            LoginButton(
              onTap: () {},
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
}
