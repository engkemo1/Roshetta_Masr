import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';

class buildColoredCard2 extends StatelessWidget {
  buildColoredCard2(
      {Key? key,
      required this.title,
      this.icon,
      required this.onTap,
      this.color,
      this.h,
      this.w,
      this.image,
      this.textColor})
      : super(key: key);
  final String title;
  final Color? color;
  final Color? textColor;

  final double? h;
  final double? w;
  final String? icon;
  final String? image;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

        child:
              SizedBox(
                height: 120,
                width: 150,
                child: Image.network(image!),

              )

    );
  }
}
