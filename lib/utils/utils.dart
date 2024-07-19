import 'package:flutter/material.dart';

Widget titleText(
    {required String text,
    Color color = Colors.white,
    double fontSize = 14,
    int? maxLines,
    TextOverflow? overflow = null,
    FontWeight fontWeight = FontWeight.w400,
    TextAlign textAlign = TextAlign.start}) {
  return Text(text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Poppins'));
}

SizedBox heightSpacer(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox widthSpacer(double width) {
  return SizedBox(
    width: width,
  );
}
