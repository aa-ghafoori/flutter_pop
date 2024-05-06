import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
    this.decorationColor,
    this.textAlign,
    super.key,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: fontSize == null ? 13.sp : fontSize!.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
