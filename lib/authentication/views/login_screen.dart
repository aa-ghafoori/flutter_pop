import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pop/authentication/views/forgot_password_screen.dart';
import 'package:pop/authentication/views/order_screen.dart';
import 'package:pop/authentication/views/sign_up_screen.dart';
import 'package:pop/core/common/widgets/custom_button.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/custom_text_form_field.dart';
import 'package:pop/core/common/widgets/underlined_clickable_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';
import 'package:pop/core/res/image_resourses.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final Color color =
        Theme.of(context).colorScheme.onBackground.withOpacity(0.3);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          children: [
            const CustomText(
                text: 'POP', fontSize: 45, fontWeight: FontWeight.w900),
            const WhiteSpace(height: 100),
            FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Welcome back',
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  const WhiteSpace(height: 7),
                  const CustomText(
                    text: "See today's top trending deals.",
                  ),
                  const WhiteSpace(height: 7),
                  Row(
                    children: [
                      CustomText(
                        text: "Need an account? ",
                        color: color,
                      ),
                      UnderlinedClickableText(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            )),
                        text: 'Sign up',
                        color: color,
                      )
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  CustomTextFormField(
                    name: 'email',
                    hintText: 'Enter your email',
                    label: 'Email*',
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  CustomTextFormField(
                    onHelperTextTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        )),
                    name: 'password',
                    label: 'Password*',
                    hintText: 'Create a password',
                    icon: Icons.remove_red_eye,
                    helperText: 'Forgot password?',
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ],
                  ),
                  const WhiteSpace(height: 45),
                  CustomButton(
                    text: 'Login',
                    textColor: Theme.of(context).colorScheme.background,
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrderScreen(),
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            const WhiteSpace(height: 22),
            CustomText(
              text: 'or',
              color: color,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
            ),
            const WhiteSpace(height: 22),
            CustomButton(
              text: 'Sign in with Google',
              imageIcon: Image.asset(ImageRes.googleLogo, scale: 20.h),
              textColor: Theme.of(context).colorScheme.onBackground,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
          ],
        ),
      ),
    );
  }
}
