import 'package:flutter/material.dart';
import 'package:pop/core/common/widgets/custom_text.dart';

class UnderlinedClickableText extends StatelessWidget {
  const UnderlinedClickableText({
    required this.text,
    this.onTap,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    super.key,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText(
        text: text,
        fontSize: fontSize ?? 13,
        fontWeight: fontWeight,
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: color,
      ),
    );
  }
}
