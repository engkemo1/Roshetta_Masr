
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:roshetta_masr/view/components/component.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/welcome_page/widget/button.dart';

import '../../../view_model/cubit/language_cubit/language_cubit.dart';
import '../../components/app_tittle.dart';
import '../../components/change_language_button.dart';
import '../auth/login/login_screen.dart';
class WelcomePageScreen extends StatelessWidget {
  final Duration duration = const Duration(milliseconds: 800);

  const WelcomePageScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body:SafeArea(
        child: Container(
            margin: const EdgeInsets.all(8),
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 2000),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 5,
                      right: 5,
                    ),
                    width: size.width,
                    height: size.height *0.1,
                    child: title(),
                  ),
                ),
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 2000),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 5,
                      right: 5,
                    ),
                    width: size.width,
                    height: size.height *0.1,
                    child: Image.asset('assets/images/logo2.png',fit: BoxFit.cover,),
                  ),
                ),

                 SizedBox(
                  height: 30.h,
                ),

                /// SUBTITLE
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 1000),
                  child:  Text(
                    'welcomeText'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 1.2,
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ///

                /// GOOGLE BTN
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 600),
                  child: SButton(
                    size: size,
                    borderColor: Colors.grey,
                    color: primaryColor,
                    text: "patient".tr(),
                    textStyle: null, onTap: () {
                    navigator(context, LoginPage(role: 1,));
                  },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 600),
                  child: SButton(
                    size: size,
                    borderColor: Colors.grey,
                    color: primaryColor,
                    text: "doctor".tr(),
                    textStyle: null, onTap: () {
                    navigator(context, LoginPage(role: 2,));

                  },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 600),
                  child: SButton(
                    size: size,
                    borderColor: Colors.grey,
                    color: primaryColor,
                    text: "pharmacist".tr(),
                    textStyle: null, onTap: () {
                    navigator(context, LoginPage(role: 3,));

                  },
                  ),
                ),

                ///
                const SizedBox(
                  height: 10,
                ),
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 600),
                  child: SButton(

                    size: size,
                    borderColor: Colors.grey,
                    color: primaryColor,
                    text: "Lab".tr(),
                    textStyle: null, onTap: () {
                    navigator(context, LoginPage(role: 4,));

                  },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                FadeInUp(
                  duration: duration,
                  delay: const Duration(milliseconds: 600),
                  child: SButton(

                    size: size,
                    borderColor: Colors.grey,
                    color: primaryColor,
                    text: "PharmaceuticalCompany".tr(),
                    textStyle: null, onTap: () {
                    navigator(context, LoginPage(role: 4,));

                  },
                  ),
                ),

                 SizedBox(
                  height: 20.h,
                ),

                // changeLanguage(context),
                const SizedBox(
                  height: 10,
                ),
                ///

              ],
            ),
          ),
        ),

    );
  }

  Row changeLanguage(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:


                [
                  GestureDetector(
                      onTap: (){
                        LanguageCubit().ChangeLanguage(context,'en');
                      },
                      child:    Text(
                        'EN',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          color: context.locale.languageCode=='en'?primaryColor:Colors.white,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      )),
                  const SizedBox(width: 10,),
                  Container(height: 20,width: 2,color: primaryColor,),
                  SizedBox(width: 10,),

                  GestureDetector(
                    onTap: (){
                      LanguageCubit().ChangeLanguage(context,'ar');

                    },
                    child:  Text(
                      'AR',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22,
                        color: context.locale.languageCode=='ar'?primaryColor:Colors.white,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ],);
  }
}


