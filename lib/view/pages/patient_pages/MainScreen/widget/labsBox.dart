import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta_masr/view/components/ButtonCustom.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../../../model/lab_model.dart';


class LabsBox extends StatelessWidget {
  LabsBox(
      {Key? key,
        required this.index,
        required this.lab,
        required this.onTap,})
      : super(key: key);
  final int index;
  final LabData lab;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                        image: NetworkImage(lab.imagePath.toString()),
                        fit: BoxFit.cover),
                  )),
              const SizedBox(height: 10),
               Text(
              lab.name.toString()  ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Row(children:  [
                const   Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 14,
                ),
                const  SizedBox(
                  width: 2,
                ),
                Text(
                  lab.address.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ]),
              const SizedBox(height: 5),
              Row(children:  [
                const Icon(
                  Icons.call,
                  color: Colors.yellow,
                  size: 14,
                ),
                const   SizedBox(
                  width: 2,
                ),
                Text(
                  lab.phone.toString(),
                  style: TextStyle(color: primaryColor, fontSize: 13),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   height: 30,
                  //   child: ButtonCustom(
                  //     title: 'Medicine request'.tr(),
                  //     onTap: () {
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             backgroundColor: Colors.transparent,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(20)),
                  //             content: SizedBox(
                  //               height: 100,
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   buildColoredCard1(
                  //                       "prescription".tr(), 'prescription.png'),
                  //                   SizedBox(
                  //                     width: 10,
                  //                   ),
                  //                   buildColoredCard1(
                  //                       "product image".tr(), 'camera.png'),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     },
                  //     color: primaryColor,
                  //     size: 12,
                  //     ColorText: Colors.white,
                  //     icon: Icons.request_quote_outlined,
                  //     iconSize: 15,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ButtonCustom(
                      title: 'محادثة'.tr(),
                      onTap: () {},
                      color: secondaryColor,
                      size: 14,
                      ColorText: Colors.white,
                      icon: Icons.chat_outlined,
                      iconSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
            ],
          )),
    );
  }

  Widget buildColoredCard1(String title, String icon) => Card(
    shadowColor: primaryColor,
    elevation: 8,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: secondaryColor),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconAssetBuild(icon, 30, 30),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
