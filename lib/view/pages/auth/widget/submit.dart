import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../components/component.dart';
import '../../patient_pages/MainScreen/MainScreen.dart';


class SubmitButton extends StatelessWidget {

  const SubmitButton({Key? key, required this.onTap}) : super(key: key);
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow:  <BoxShadow>[
              BoxShadow(
                  color: secondaryColor.withOpacity(0.3),
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [primaryColor,primaryColor.withOpacity(0.2)])),
        child: Text(
          'login'.tr(),
          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
        ),
      )
    );  }
}

