import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta_masr/view/components/ButtonCustom.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../../../model/all_doctor_model.dart';

class DoctorBox extends StatelessWidget {
  DoctorBox(
      {Key? key,
      required this.index,
      required this.doctor,
      required this.onTap})
      : super(key: key);
  final int index;
  Data doctor;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
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
                    image: DecorationImage(
                        image: NetworkImage(doctor.imagePath.toString()),
                        fit: BoxFit.cover),
                  )),
              const SizedBox(height: 10),
              Text(
                doctor.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text(
               "${doctor.specialization}".tr(),
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "${doctor.areaId} ",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "reviews".tr(),
                        style: TextStyle(fontSize: 12),
                      ),


                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: ButtonCustom(
                      title: 'book'.tr(),
                      onTap: () {},
                      color: secondaryColor,
                      size: 16,
                      ColorText: Colors.white,
                      icon: Icons.book_outlined,
                      iconSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 30,
                    child: ButtonCustom(
                      title: 'chat'.tr(),
                      onTap: () {},
                      color: secondaryColor,
                      size: 16,
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
}
