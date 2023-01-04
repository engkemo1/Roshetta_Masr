
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
final String title;
final Check;
final typeKeyboard;
final isScure;
 final value;
  const TextFormFieldCustom({ required this.title, this.Check,  this.typeKeyboard, this.isScure, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      width: 400,
      height: 50,

      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(26.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),

        ],
      ),
      child: TextFormField(
        keyboardType: typeKeyboard,
        validator: Check,
        onSaved: (val) {
                 },
        obscureText: isScure,

        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintText: title,
          hintStyle:  TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              color: const Color(0x63492f24),
              fontWeight: FontWeight.w700,

          ),
          border: InputBorder.none

        ),
      )
    );
  }
}
