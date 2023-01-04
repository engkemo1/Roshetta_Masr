import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


//Here we Build light Theme
ThemeData lightTheme(context) {
  return ThemeData(
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: Colors.black,fontFamily: 'roboto'),
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.green,
    appBarTheme: const AppBarTheme(
    //  toolbarHeight: 80,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.green,
      ),
      color: Colors.white,
      elevation: 0,

      titleTextStyle: TextStyle(),
    ),
    );
}
