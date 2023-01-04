import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../component.dart';

class AppBarCustom extends StatelessWidget {
  Widget _appBarButton(String title, VoidCallback onTap, BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
        padding: EdgeInsets.only(left: size * 0.01, right: size * 0.01),
        child: TextButton(
          child: Text(title,
              style: GoogleFonts.getFont(
                'Lato',
                color: Color(0xffC9C9C9),
                fontSize: size * 0.01,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              )),
          onPressed: onTap,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size
        .width;

    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,end:Alignment.centerRight ,
                  colors: [
                    Colors.black
                    ,
                    Colors.black12
                  ]
              )
          ),

          height: 90,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/image/logo.svg',
                  width: 100,
                ),
                IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: Icon(Icons.more_vert,))
              ],
            ) , )

          ),
        );
  }
}


