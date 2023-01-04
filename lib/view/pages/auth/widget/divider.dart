import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget divider() {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Row(
      children: <Widget>[
        const SizedBox(
          width: 20,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'.tr(),style: TextStyle(color: Colors.white),),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
