import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pop/core/common/widgets/custom_text.dart';
import 'package:pop/core/common/widgets/white_space.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.onPressed,
    this.imageIcon,
    super.key,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final Widget? imageIcon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            width: 1.5,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3)),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        minimumSize: Size.fromHeight(45.h),
        padding: EdgeInsets.all(10.r),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      onPressed: onPressed,
      child: imageIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageIcon!,
                const WhiteSpace(width: 10),
                CustomText(
                  text: text,
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )
              ],
            )
          : CustomText(
              text: text,
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
    );
  }
}
