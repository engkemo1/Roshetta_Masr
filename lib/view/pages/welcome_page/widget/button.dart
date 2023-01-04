
import 'package:flutter/material.dart';

import '../welcome_page_screen.dart';

class SButton extends StatelessWidget {
  SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    this.img,
    required this.text,
    required this.textStyle, required this.onTap,
  }) : super(key: key);
  final void Function() onTap;
  final Size size;
  final Color color;
  final Color borderColor;
  String? img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                tileMode: TileMode.decal,
                end: Alignment.centerRight,
                colors: [color,color]),            color: color,
            borderRadius: BorderRadius.circular(10),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img==null? SizedBox():Image.asset(
              img!,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }}