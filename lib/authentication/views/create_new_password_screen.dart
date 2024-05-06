import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pop/authentication/views/login_screen.dart';
import 'package:pop/core/common/widgets/custom_button.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/custom_text_form_field.dart';
import 'package:pop/core/common/widgets/underlined_clickable_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';
import 'package:pop/core/res/image_resourses.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

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
                    text: 'Create New Password',
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  const WhiteSpace(height: 7),
                  const CustomText(
                    text: 'Please create your new password.',
                  ),
                  const WhiteSpace(height: 7),
                  Row(
                    children: [
                      CustomText(
                        text: "Need password suggestions? ",
                        color: color,
                      ),
                      UnderlinedClickableText(
                        text: 'Suggestions',
                        color: color,
                      )
                    ],
                  ),
                  const WhiteSpace(height: 30),
                  CustomTextFormField(
                    controller: _passwordController,
                    name: 'password',
                    label: 'Create New Password*',
                    hintText: 'Create new password',
                    icon: Icons.remove_red_eye,
                    helperText: 'Must be at least 8 characters.',
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  CustomTextFormField(
                    name: 'password',
                    label: 'Reenter New Password*',
                    hintText: 'Reenter new password',
                    icon: Icons.remove_red_eye,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      (val) {
                        if (val != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ],
                  ),
                  const WhiteSpace(height: 45),
                  CustomButton(
                    text: 'Create New Password',
                    textColor: Theme.of(context).colorScheme.background,
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
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
