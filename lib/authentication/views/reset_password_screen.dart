import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:pop/authentication/views/create_new_password_screen.dart';
import 'package:pop/core/common/widgets/custom_button.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/underlined_clickable_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';
import 'package:pop/core/res/image_resourses.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
            const CustomText(
              text: 'Reset Password?',
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
            const WhiteSpace(height: 7),
            const CustomText(
              text:
                  'Please enter the password reset code below that was sent to aj@social.com.',
            ),
            const WhiteSpace(height: 7),
            Row(
              children: [
                CustomText(
                  text: "Didn't receive instructions? ",
                  color: color,
                ),
                UnderlinedClickableText(
                  text: 'Try different method',
                  color: color,
                )
              ],
            ),
            const WhiteSpace(height: 30),
            const CustomText(
              text: 'Code',
              fontWeight: FontWeight.w800,
            ),
            const WhiteSpace(height: 4),
            Pinput(
              length: 5,
              separatorBuilder: (index) => const WhiteSpace(width: 20),
              defaultPinTheme: PinTheme(
                width: 45.w,
                height: 45.h,
                textStyle:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            const WhiteSpace(height: 50),
            CustomButton(
              text: 'Reset Password',
              textColor: Theme.of(context).colorScheme.background,
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateNewPasswordScreen(),
                  ),
                );
              },
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
