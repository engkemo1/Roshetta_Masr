import 'package:flutter/material.dart';

import '../view_model/database/local/cache_helper.dart';

const Color primaryColor = Color(0xffffcd0c);
const Color backgroundCirclar = Color(0xff492f24);
const Color secondaryColor = Color(0xff35b18c);
const kBackgroundColor = Color(0xFFD2FFF4);
const kPrimaryColor = Color(0xFF2D5D70);
const kSecondaryColor = Color(0xFF265DAB);

const Color gradientFirstColor = Color(0xff674739);
const Color gradientSecondColor = Color(0xff180701);
const textColorDrawer = Colors.white;
const iconColorDrawer = Colors.white;
const shadowColor = Color.fromRGBO(143, 148, 251, .2);
const imagePath='assets/images/';
const iconPath='assets/icons/';

String? userToken = CacheHelper.get(key: "accessToken");
String? userView = CacheHelper.get(key: "userView");

Widget imageAssetBuild(String name){
  return Image.asset('$imagePath${name}');

}
Widget iconAssetBuild(String name,double h,double w){
  return Image.asset('$iconPath${name}',height: h,width: w,);

}



LinearGradient gradientColor({required Color one, required Color two}) {
  return LinearGradient(
    colors: [one, two],
  );
}

const gray = Color(0xffFAFAFA);
const grayTwo = Color(0xffF5F5F5);
const grayText = Color(0xff9F9D9B);


bool connected = true;

const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Colors.grey;
const kBlackColor = Color(0xFF101010);
const double kDefaultPadding = 20.0;

const newVv = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [Color(0xff3FB8C0), Color(0xff0399A0), Color(0xff07919c)],
);




   String? requiredField(String val) {
    if (val.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

   String? passFieldValidator(String val) {
    if (val.isEmpty) {
      return 'this field is required';
    }
    if (val.length < 8) {
      return 'must be more than 8 digits';
    }
    if (!val.contains(RegExp(r'[A-Z]'))) {
      return 'enter 1 upper char at least';
    }
    if (!val.contains(RegExp(r'[a-z]'))) {
      return 'enter 1 lower char at least';
    }
    if (!val.contains(RegExp(r'[0-9]'))) {
      return 'enter 1 number atLeast';
    } else {
      return null;
    }
  }



const orangeGradient = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [Color(0xffFF6600), Color(0xffFF9752), Color(0xffFFC9A5)],
);


