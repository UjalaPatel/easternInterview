import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constant/size_constant.dart';
import '../core/them/const_color.dart';

class CommonText extends Text {
  CommonText(
      {super.key,
      required String text,
      Color? fontColor,
      double? fontSize,
      int? maxLine,
      TextOverflow? overflow,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      FontWeight? fontWeight,
      String? fontFamily,
      double? letterSpacing})
      : super(text,
            softWrap: true,
            overflow: overflow,
            maxLines: maxLine,
            style: TextStyle(
                letterSpacing: letterSpacing ?? 0,
                decoration: textDecoration ?? TextDecoration.none,
                fontSize: fontSize ?? textSize14Px,
                color: fontColor ?? ConstColor.blackColor,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontFamily: fontFamily ?? GoogleFonts.raleway().fontFamily),
            textAlign: textAlign);
}
