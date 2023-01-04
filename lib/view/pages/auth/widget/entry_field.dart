import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';

class EntryFiled extends StatelessWidget {
  EntryFiled(
      {Key? key,
      this.isPassword = false,
      required this.title,
      this.icon,
      this.enable,
        this.onTap,
      required this.textInputType,
      this.controller})
      : super(key: key);
  bool isPassword;
  void Function()? onTap;
  final String title;
  bool? enable;

  final TextEditingController? controller;

  IconData? icon;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap??null,
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: TextField(
            enabled: enable ?? null,
            controller: controller ?? null,
            style: TextStyle(color: Colors.grey),
            obscureText: isPassword,
            keyboardType: textInputType,
            decoration: InputDecoration(
                label: Text(
                  title,
                  style: TextStyle(color: Colors.grey),
                ),
                suffixIcon: Icon(
                  icon,
                  color: secondaryColor,
                ),
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
      ),
    );
  }
}
