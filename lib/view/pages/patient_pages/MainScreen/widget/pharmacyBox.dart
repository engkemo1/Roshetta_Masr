import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roshetta_masr/view/components/ButtonCustom.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../../../model/all_doctor_model.dart';
import '../../../../../view_model/cubit/pharmacy_cubit/pharmacy_cubit.dart';
import '../../../auth/widget/entry_field.dart';
import 'build_colored_card2.dart';

class PharmacyBox extends StatefulWidget {
  PharmacyBox(
      {Key? key,
      required this.index,
      required this.doctor,
      required this.onTap,
      required this.image})
      : super(key: key);
  final int index;
  final String image;
  final Data doctor;
  final GestureTapCallback onTap;

  @override
  State<PharmacyBox> createState() => _PharmacyBoxState();
}

class _PharmacyBoxState extends State<PharmacyBox> {
  TextEditingController descController = TextEditingController();
  List<File>? imageFileList = [];
  File? imageFile;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                    image: DecorationImage(
                        image: NetworkImage(widget.doctor.imagePath!),
                        fit: BoxFit.cover),
                  )),
              const SizedBox(height: 10),
              Text(
                widget.doctor.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Row(children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 14,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  widget.doctor.address.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ]),
              const SizedBox(height: 5),
              Row(children: [
                const Icon(
                  Icons.call,
                  color: secondaryColor,
                  size: 16,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  widget.doctor.phone.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ]),
              const SizedBox(height: 3),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: ButtonCustom(
                      title: 'Medicine request'.tr(),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              content: SizedBox(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildColoredCard1(
                                        "prescription".tr(), 'prescription.png',
                                        () {
                                          buildCamera().then((value) {
                                            Navigator.pop(context);
                                            return showAnimatedDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Align(
                                                  alignment: Alignment.center,
                                                  child: Material(
                                                    child: Container(
                                                      padding: EdgeInsets.all(20),
                                                      color: secondaryColor,
                                                      height: 170,
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Column(
                                                        children: [
                                                          EntryFiled(title: 'Description', textInputType: TextInputType.text,controller: descController,)
                                                          ,  ButtonCustom(title: 'Send', color:primaryColor ,onTap: (){
                                                            PharmacyCubit().makeOrder('1', widget.doctor.id!.toString(), descController.text,imageFileList);
                                                            Navigator.pop(context);

                                                          }),
                                                        ],
                                                      ),

                                                    ),
                                                  ),
                                                );
                                              },
                                              animationType: DialogTransitionType.size,
                                              curve: Curves.fastOutSlowIn,
                                              duration: const Duration(seconds: 1),
                                            );
                                          });
                                    }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    buildColoredCard1(
                                        "product image".tr(), 'camera.png', () {
                                      buildCamera().then((value) {
                                        Navigator.pop(context);
                                        return showAnimatedDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Material(
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  color: secondaryColor,
                                                  height: 200,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Column(
                                                    children: [
                                                    TextField(
                                                      controller: descController,
                                                      maxLines: 3,
                                                      decoration: InputDecoration(

                                                        hintText: 'Description',
                                                          border: OutlineInputBorder(
                                                              borderSide:   BorderSide(
                                                                color: Colors.white,
                                                              ),
                                                           borderRadius: BorderRadius.circular(15)
                                                          )   ,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      enabledBorder: OutlineInputBorder(
                                                     borderSide:   BorderSide(
                                                            color: Colors.white,
                                                            ),

                                                          borderRadius: BorderRadius.circular(15)
                                                      )   , ),
                                                    ),
                                                      SizedBox(height: 15,),
                                                      SizedBox(height: 40,child:                                                       ButtonCustom(
                                                          title: 'Send',
                                                          color: primaryColor,
                                                          onTap: () {
                                                            PharmacyCubit().makeOrder(
                                                                '1',
                                                                widget
                                                                    .doctor.id!
                                                                    .toString(),
                                                                descController
                                                                    .text,
                                                                imageFileList);
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                          )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          animationType:
                                              DialogTransitionType.size,
                                          curve: Curves.fastOutSlowIn,
                                          duration: const Duration(seconds: 1),
                                        );
                                      });
                                    }),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      color: secondaryColor,
                      size: 12,
                      ColorText: Colors.white,
                      icon: Icons.request_quote_outlined,
                      iconSize: 15,
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
                      size: 12,
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

  Widget buildColoredCard1(String title, String icon, void Function() onTap) =>
      Card(
        shadowColor: primaryColor,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: onTap,
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
        ),
      );

  buildCamera()async {

    try {
      final images = await ImagePicker().pickMultiImage(
          maxWidth: 600, maxHeight: 600, imageQuality: 50);
      if (images == null) return;
      for (XFile image in images) {
        var imagesTemporary = File(image.path);
        imageFileList!.add(imagesTemporary);
      }
    } catch (e) {}
    setState(() {});

    }
}
