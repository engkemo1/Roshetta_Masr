import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Widget title({double size=30}) {
  return RichText(
    textAlign: TextAlign.center,
    text:  TextSpan(
        text: 'R'.tr(),
        style:  TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w700,
            color: primaryColor
        ),
        children: [
          TextSpan(
            text: 'os'.tr(),
            style: TextStyle(color: Colors.white, fontSize: size),
          ),
          TextSpan(
            text: 'hetta'.tr(),
            style:  TextStyle(color:primaryColor, fontSize: size),
          ),
          TextSpan(
            text: ' M'.tr(),
            style:  TextStyle(color:Colors.white, fontSize: size),
          ),
          TextSpan(
            text: 'asr'.tr(),
            style:  TextStyle(color: primaryColor, fontSize: size),
          ),
        ]),
  );
}
