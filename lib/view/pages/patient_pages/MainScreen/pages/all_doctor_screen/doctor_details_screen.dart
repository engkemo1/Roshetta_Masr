import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/all_doctor_model.dart';
import '../../../../../components/ButtonCustom.dart';
import '../../../../../constants.dart';


class DoctorDetailsScreen extends StatelessWidget {
   DoctorDetailsScreen({Key? key, this.doctor}) : super(key: key);
  Data? doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width,child:                   Image.network(doctor!.imagePath.toString()),
                      height: 200,),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      )),
                  Positioned(
                      bottom: 10,right: 5,
                      child:         Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black38
                          ),
                          child:Row(
                            children:  [
                              Text(
                                doctor!.phone.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                              Icon(Icons.phone,color: secondaryColor,),

                            ],
                          ))),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Text(
                  doctor!.name.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),

              ],),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [

                      Text(
                      'timesOfWork'.tr(),
                      style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                    ),
                      Text(
                      'صباحا ${doctor!.from} الى مساء ${doctor!.to}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      'specialization2'.tr(),
                      style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                    ),
                    Text(
                      "${doctor!.specialization.toString()}".tr(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                     SizedBox(height: 10,),
                     Text(
                      'about:'.tr(),
                      style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                    ),
                    const Text(
                      '''تخرج الدكتور رائد خليفة من مدارس الفرير الواقعة في عمان الأردن, جبل الحسين في عام ألف وتسعمائة وخمسة وتسعين. حيث التحق بعدها بكلية الطب والجراحة العامة في جامعة ...
''',
                      style: TextStyle(fontSize: 18),
                    ),
                     Text(
                      'address2'.tr(),
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                    ),
                     Text(
                      doctor!.address.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: ButtonCustom(
                            title: 'book'.tr(),
                            onTap: () {},
                            color: secondaryColor,
                            size: 18,
                            ColorText: Colors.white,
                            icon: Icons.book_outlined,
                            iconSize: 18,
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
                            size: 18,
                            ColorText: Colors.white,
                            icon: Icons.chat_outlined,
                            iconSize: 18,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
