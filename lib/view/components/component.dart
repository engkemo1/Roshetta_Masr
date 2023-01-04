import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';

import 'text_custom/text_custom.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Future<bool?> showToast({required String message, Color color = Colors.green}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,

    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0.sp,
  );
}

void navigatorAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}

void navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

BoxShadow builtBoxShadow() => BoxShadow(
  color: Colors.grey[200]!,
  spreadRadius: 2,
  blurRadius: 3,
  offset: const Offset(1, 1.5), // changes position of shadow
);






// Widget offline(child) {
//   return Stack(
//     fit: StackFit.expand,
//     children: [
//       child,
//       Positioned(
//         left: 0.0,
//         right: 0.0,
//         height: 32.0,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           color: connected != true ? secondaryColor : null,
//           child: connected != true
//               ? Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:  <Widget>[
//              textCustom(text:
//                 "No connection",
//                  color: Colors.white
//               ),
//               const SizedBox(
//                 width: 8.0,
//               ),
//               const SizedBox(
//                 width: 12.0,
//                 height: 12.0,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.0,
//                   valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               ),
//             ],
//           )
//               : null,
//         ),
//       ),
//     ],
//   );
// }


dynamic fileUpload(File file) async {
  String fileName = file.path.split('/').last;
  return await MultipartFile.fromFile(
    file.path,
    filename: fileName,
    contentType: MediaType("image", fileName.split(".").last),
  );
}

Widget emptyPage({required String text, required context}) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset('assets/empty.json',
          //     width: MediaQuery.of(context).size.width / 1),
         textCustom(text:
            text,
             fontSize: 20.sp,
          ),
        ],
      ),
    ),
  );
}dialog(context, message) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.BOTTOMSLIDE,

    title: '',
    // padding: const EdgeInsets.all(5.0),
    desc: message,
    btnOkColor: Colors.orange,
    btnOkOnPress: () {},
  ).show();
}
