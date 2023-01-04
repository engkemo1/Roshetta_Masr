import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../components/component.dart';
import '../login/login_screen.dart';

Widget createAccountLabel(int role,BuildContext context,String text,Widget widget,String textAction) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,color: Colors.white),
          ),
          const SizedBox(
            width: 4,
          ),
          InkWell(
            onTap: () {
              navigator(context, widget);
            },
            child: Text(
              textAction,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    ),
  );
}
