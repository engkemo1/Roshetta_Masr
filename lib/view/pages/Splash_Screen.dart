import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/doctor_pages/doctor_main_screen/doctor_main_screen.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/MainScreen.dart';
import 'package:roshetta_masr/view/pages/pharmacy_pages/main_screen/pharmacy_main_screen.dart';
import 'package:roshetta_masr/view/pages/welcome_page/welcome_page_screen.dart';

import '../../view_model/database/local/cache_helper.dart';
import 'chat_page/chat_page.dart';

class SplashScreen extends StatelessWidget {
  var token = CacheHelper.get(key: 'token');
  var token2 = CacheHelper.get(key: 'DoctorToken');
  var token3 = CacheHelper.get(key: 'PharmacyToken');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('assets/images/logo2.png'),
            splashIconSize: 400,
            nextScreen: token != null &&token2 == null&& token3 == null
                ? const MainScreen()
                : token2 != null&&token == null&& token3 == null
                    ? DoctorMainScreen()
                    : token3 != null&&token2 == null&& token == null
                        ? PharmacyMainScreen()
                        : const WelcomePageScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: secondaryColor));
  }
}
