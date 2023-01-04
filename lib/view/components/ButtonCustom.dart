import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? ColorText;

  final double? width;
  final double? size;
  final double? iconSize;

  final IconData? icon;
  final VoidCallback onTap;

  const ButtonCustom(
      {required this.title,
      this.color,
      this.width,
      this.icon,
      required this.onTap, this.size, this.ColorText, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon==null?SizedBox():Icon(icon,size: iconSize??null,),
SizedBox(width: 3,),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ColorText, fontSize: size??20),
          )
        ],
      ),
    );
  }
}
