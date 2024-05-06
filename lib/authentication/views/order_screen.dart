import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pop/authentication/views/sign_up_screen.dart';
import 'package:pop/core/common/widgets/custom_button.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/custom_text_form_field.dart';
import 'package:pop/core/common/widgets/underlined_clickable_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';
import 'package:pop/core/res/image_resourses.dart';
import 'package:pop/core/utils/card_expiration_formatter.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
                    text: 'Payment Details',
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  const WhiteSpace(height: 7),
                  const CustomText(
                    text: 'Payment Details',
                  ),
                  const WhiteSpace(height: 7),
                  Row(
                    children: [
                      CustomText(
                        text: "Promo code? ",
                        color: color,
                      ),
                      UnderlinedClickableText(
                        text: 'Enter here',
                        color: color,
                      )
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  CustomTextFormField(
                    name: 'name',
                    hintText: 'Enter name on card',
                    label: 'Name on Card',
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  CustomTextFormField(
                    name: 'card',
                    label: 'Card Number',
                    hintText: 'Enter card number',
                    hideText: true,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.creditCard(),
                    ],
                  ),
                  const WhiteSpace(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          name: 'expiratoin date',
                          label: 'Expiration Date',
                          hintText: 'mm/yy',
                          keyboardType: TextInputType.number,
                          inputFormatters: [CardExpirationFormatter()],
                          validators: [
                            FormBuilderValidators.required(),
                            (value) {
                              if (value != null) {
                                if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$')
                                    .hasMatch(value)) {
                                  return 'Invalid date format';
                                }
                              }
                              return null;
                            },
                          ],
                        ),
                      ),
                      const WhiteSpace(width: 30),
                      Expanded(
                        child: CustomTextFormField(
                          name: 'cvv',
                          label: 'CVV',
                          hintText: '',
                          keyboardType: TextInputType.number,
                          validators: [
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(3,
                                errorText: "Minimun of 3 digits"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const WhiteSpace(height: 45),
                  CustomButton(
                    text: 'Submit Order',
                    textColor: Theme.of(context).colorScheme.background,
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
            const WhiteSpace(height: 10),
            Wrap(
              children: [
                CustomText(
                  text: 'By clicking submit order, you agree to our ',
                  color: color,
                ),
                UnderlinedClickableText(
                  text: 'Terms',
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
                CustomText(
                  text: ' and ',
                  color: color,
                ),
                UnderlinedClickableText(
                  text: 'Privacy Policy',
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ],
            ),
            const WhiteSpace(height: 10),
            CustomButton(
              text: 'Cancel Order',
              textColor: Theme.of(context).colorScheme.onBackground,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            const WhiteSpace(height: 22),
            CustomText(
              text: 'or',
              color: color,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
            ),
            const WhiteSpace(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageRes.applePay,
                  scale: 10.h,
                ),
                Image.asset(
                  ImageRes.googlePay,
                  scale: 15.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
