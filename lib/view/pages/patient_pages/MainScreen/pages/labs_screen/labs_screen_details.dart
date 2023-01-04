import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/lab_model.dart';
import '../../../../../components/ButtonCustom.dart';
import '../../../../../constants.dart';


class LabsScreenDetails extends StatelessWidget {
  const LabsScreenDetails({Key? key, required this.lab,}) : super(key: key);
  final LabData lab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(height: 180,width: MediaQuery.of(context).size.width,child:                 Image.asset(lab.imagePath.toString()),
                    ),
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
                  bottom: 10,right: 10,
                  child:         Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black38
                      ),
                      child:Row(
                    children:  [
                      Text(
                        lab.phone.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Icon(Icons.phone,color: secondaryColor,),

                    ],
                  ))),
                Positioned(
                    bottom: 10,left: 10,
                    child:                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black38
                      ),
                      child:  Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "21",
                            style: const TextStyle(fontSize: 14,color: Colors.white),
                          ),
                          Text(
                            "reviews".tr(),
                            style: const TextStyle(fontSize: 14,color: Colors.white),
                          ),


                        ],
                      ),
                    )
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children:  [
              Text(
                lab.name.toString(),
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),

            ],),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                    Text(
                    'timesOfWork'.tr(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),
                  const  Text(
                    'صباحا 9 الى مساء 10',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'about'.tr(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),
                 const Text(
''''المختبر الطبي Medical laboratory، هو مختبر تتم فيه الفحوصات والتحليلات الطبية للحصول على معلومات حول الحالة الصحية للمريض بغرض التشخيص أو العلاج أو للوقاية من الأمراض. Clinical laboratory in a Hospital setting showing several automated analysers
''',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'address2'.tr(),
                    style:const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),
                  Text(
                    lab.address.toString(),
                    style:const TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40,),
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
    );
  }
}
