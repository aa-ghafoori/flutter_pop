import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/underlined_clickable_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';

class CustomTextFormField extends HookWidget {
  const CustomTextFormField({
    required this.name,
    required this.label,
    required this.hintText,
    required this.validators,
    this.icon,
    this.helperText,
    this.controller,
    this.onHelperTextTap,
    this.hideText,
    this.inputFormatters,
    this.keyboardType,
    super.key,
  });

  final String name;
  final String label;
  final String hintText;
  final List<String? Function(String?)> validators;
  final IconData? icon;
  final String? helperText;
  final TextEditingController? controller;
  final VoidCallback? onHelperTextTap;
  final bool? hideText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(false);
    final Color hintColor =
        Theme.of(context).colorScheme.onBackground.withOpacity(0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: label,
              fontWeight: FontWeight.w800,
            ),
            const WhiteSpace(width: 5),
            onHelperTextTap != null
                ? UnderlinedClickableText(
                    text: helperText ?? '',
                    onTap: onHelperTextTap,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: hintColor,
                  )
                : CustomText(
                    text: helperText ?? '',
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: hintColor,
                  )
          ],
        ),
        const WhiteSpace(height: 4),
        FormBuilderTextField(
          inputFormatters: inputFormatters,
          controller: controller,
          name: name,
          obscureText: hideText ?? obscureText.value,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing:
                (name == 'password' && obscureText.value) || (hideText ?? false)
                    ? 5
                    : null,
          ),
          decoration: InputDecoration(
            suffixIcon: icon != null
                ? GestureDetector(
                    onTap: () => obscureText.value = !obscureText.value,
                    child: Icon(
                      icon,
                      color: hintColor,
                    ),
                  )
                : null,
            suffixIconConstraints:
                BoxConstraints(minWidth: 40.w, minHeight: 10.h),
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: hintColor,
                letterSpacing: 0),
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1.5, color: hintColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 1.5,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          validator: FormBuilderValidators.compose(validators),
        ),
      ],
    );
  }
}
