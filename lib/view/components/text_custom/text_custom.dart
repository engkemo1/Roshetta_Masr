import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


textCustom({
  required String text,
   double? fontSize = 14.0,
  Color? color = Colors.green,
  FontWeight? fontWeight = FontWeight.normal,
  TextDecoration? decoration = TextDecoration.none,
  int? maxLines = 1,
  TextAlign? textAlign = TextAlign.start,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize?.sp,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: Colors.green,

    ),
  );
}
