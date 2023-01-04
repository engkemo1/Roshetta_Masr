import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/all_doctor_model.dart';
import '../../../../../components/ButtonCustom.dart';
import '../../../../../constants.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  const PharmacyDetailsScreen({super.key, required this.data});
final Data data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(data.imagePath!),),
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
                              data.phone.toString(),
                              style:const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const    Icon(Icons.phone,color: secondaryColor,),

                          ],
                        ))),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children:  [
              Text(
                data.name.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),

            ],),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 10,),

                  Text(
                    'timesOfWork'.tr(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),

                  const  Text(
                    'صباحا 9 الى مساء 10',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10,),

                  Text(
                    'about:'.tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),
                  const Text(
'''الصيدلية هي مرفق للرعاية الصحية تؤكد توفير الخدمات الصيدلانية لمجتمع معين. كما تقوم بصرف الدواء ويتضمن فيها وجود مسجل صيدلاني مضمون. يمكن أن تكون الصيدلية تابعة للقطاع الخاص، كما يمكن أن تكون مؤسسة عامة تابعة لوزارة الصحة يتم فيها عمليات تركيب الأدوية وصرفها ومراجعتها والتأكد من كفائتها.
''''',
                    style: TextStyle(fontSize: 18),
                  ),

                  Text(
                    'address2'.tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: secondaryColor),
                  ),
                   Text(
                    data.address.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ButtonCustom(
                          title: 'Medicine request'.tr(),
                          onTap: () {},
                          color: secondaryColor,
                          size: 13,
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
                          title: 'Consult a pharmacist'.tr(),
                          onTap: () {},
                          color: secondaryColor,
                          size: 13,
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
