import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roshetta_masr/view/components/component.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/auth/widget/baziier_container.dart';
import 'package:roshetta_masr/view/components/select_country.dart';
import '../../../../model/auth/city_model.dart';
import '../../../../view_model/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../view_model/cubit/sign_up_cubit/sign_up_state.dart';
import '../../../components/app_tittle.dart';
import '../../doctor_pages/doctor_main_screen/doctor_main_screen.dart';
import '../../patient_pages/MainScreen/MainScreen.dart';
import '../login/login_screen.dart';
import '../widget/divider.dart';
import '../widget/entry_field.dart';
import '../widget/submit.dart';
import '../widget/text_account.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, this.title, required this.role}) : super(key: key);
  final int role;

  final String? title;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? imagFile;
  File? cardFile;

  String? picUrl;
  String? picUrl2;
  String? image2;
  String? image;
  final Duration duration = const Duration(milliseconds: 800);
  final TextEditingController _endTimeController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _passConController = TextEditingController();
  TextEditingController? _clinicController = TextEditingController();
  TextEditingController? _specializationController = TextEditingController();
  TextEditingController? _cardController = TextEditingController();
  TextEditingController? _licController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // TextEditingController? _pharmacyController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  String _startDate = DateFormat('HH:mm:ss').format(DateTime.now());
  String _endDate =
      DateFormat('HH:mm:ss').format(DateTime.now().add(Duration(minutes: 2)));
  final List<String> items = [
    'Male',
    'Female',
  ];
  var city = [];
  var area = [];
  var delivery = ['يوجد', 'لايوجد'];

  List<CityData> valueList = [];
  String? selectedDelivery;

  String? selectedArea;
  String? selectedCity;
  String? areaId;
  String? selectedValue;

  @override
  void initState() {
    SignupCubit().getArea().then((value) {
      valueList = value;
      value.forEach((e) {
        city.add(e.name.toString());
        e.area!.forEach((element) {
          area.add(element.name);
        });
      });
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: secondaryColor,
        body: SafeArea(
            child: SizedBox(
                height: height,
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: -height * .15,
                          right: -MediaQuery.of(context).size.width * .4,
                          child: BezierContainer()),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height * .2),
                            FadeInUp(
                                duration: duration,
                                delay: const Duration(milliseconds: 600),
                                child: buildCamera(context)),
                            const SizedBox(height: 60),
                            Column(
                              children: [
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: _fieldsWidget(),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          buttonPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          style: TextStyle(color: Colors.grey),
                                          buttonDecoration: BoxDecoration(
                                            color: Color(0xfff3f3f4),
                                          ),
                                          icon: Icon(
                                            Icons.add_location_alt_outlined,
                                            color: secondaryColor,
                                          ),
                                          isDense: true,
                                          isExpanded: true,
                                          hint: Text(
                                            'City',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: city
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedCity,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCity = value as String;
                                            });
                                          },
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          buttonPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          style: TextStyle(color: Colors.grey),
                                          buttonDecoration: BoxDecoration(
                                            color: Color(0xfff3f3f4),
                                          ),
                                          icon: Icon(
                                            Icons.location_city_outlined,
                                            color: secondaryColor,
                                          ),
                                          isDense: true,
                                          isExpanded: true,
                                          hint: Text(
                                            'Area',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: area
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedArea,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedArea = value as String;
                                            });
                                          },
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          buttonPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          style: TextStyle(color: Colors.grey),
                                          buttonDecoration: BoxDecoration(
                                            color: Color(0xfff3f3f4),
                                          ),
                                          icon: Icon(
                                            Icons.transgender_rounded,
                                            color: secondaryColor,
                                          ),
                                          isDense: true,
                                          isExpanded: true,
                                          hint: Text(
                                            'Gender',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: items
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                            });
                                          },
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: BlocConsumer<SignupCubit, SignupState>(
                                    builder: (BuildContext context, state) {
                                      return state is SignupLoading
                                          ? CircularProgressIndicator()
                                          : SubmitButton(
                                              onTap: () async {
                                                 valueList.forEach((element) {
                                                areaId=  element.area!.firstWhereOrNull(
                                                          (element) =>
                                                      element.name ==
                                                          selectedArea)!
                                                      .id
                                                      .toString();
                                                setState(() {

                                                });

                                                });


                                                print(areaId);
                                                String gender =
                                                    selectedValue == 'Female'
                                                        ? 'f'
                                                        : 'm';
                                                String? delivery=selectedDelivery=='يوجد'?'1':'0';
                                                String from = _startDate;
                                                String to = _endDate;
                                                String clinic =
                                                    _clinicController!.text ??
                                                        '';
                                                String spe =
                                                    _specializationController!
                                                            .text ??
                                                        '';

                                                if (imagFile != null) {
                                                  SignupCubit().signUp(
                                                      context,
                                                      _nameController.text,
                                                      _emailController.text,
                                                      _passController.text,
                                                      _passConController.text,
                                                      areaId!,
                                                      gender,
                                                      _addressController.text,
                                                      _phoneController.text,
                                                      _selectedDate,
                                                      clinic,
                                                      spe,
                                                      from,
                                                      to,
                                                      cardFile ?? null,
                                                      _licController!.text,
                                                      delivery??'',
                                                      imagFile!,
                                                      widget.role);
                                                } else {
                                                  showToast(
                                                      message:
                                                          'Please select image',
                                                      color: Colors.red);
                                                }
                                              },
                                            );
                                    },
                                    listener: (BuildContext context,
                                        Object? state) {},
                                  ),
                                ),
                                divider(),
                                createAccountLabel(
                                    widget.role,
                                    context,
                                    'haveAccount'.tr(),
                                    LoginPage(
                                      role: widget.role,
                                    ),
                                    'login'.tr()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  Container buildCamera(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:
           BoxDecoration(color: primaryColor, shape: BoxShape.circle
          ,image:imagFile!=null? DecorationImage(image: FileImage(imagFile!),fit: BoxFit.cover):null
          ),
      child:Center(
        child: InkWell(
            onTap: () {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                  const Text(
                                    "Camera",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                try {
                                  final _pickedFile =
                                      await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                  );
                                  imagFile = File(_pickedFile!.path);
                                  setState(() {});
                                  Navigator.pop(context);
                                } catch (error) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Icon(
                                        Icons.photo,
                                        color: Colors.black,
                                        size: 35,
                                      ),
                                    ),
                                    const Text(
                                      "Gallery",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  final _pickedFile =
                                      await ImagePicker().pickImage(
                                    source: ImageSource.gallery,
                                    maxHeight: 400,
                                    maxWidth: 400,
                                  );
                                  imagFile = File(_pickedFile!.path);
                                  setState(() {});

                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                },
                animationType: DialogTransitionType.size,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
              );
            },
            child: const Icon(
              Icons.linked_camera,
              color: secondaryColor,
              size: 40,
            )),
      )
    );
  }

  Widget _fieldsWidget() {
    return Column(
      children: <Widget>[
        EntryFiled(
          controller: _nameController,
          title: "name".tr(),
          icon: Icons.person_outline_rounded,
          textInputType: TextInputType.name,
        ),
        widget.role == 3
            ? EntryFiled(
                title: "pharmacyName".tr(),
                icon: Icons.local_pharmacy_outlined,
                textInputType: TextInputType.name,
              )
            : widget.role == 2
                ? EntryFiled(
                    controller: _clinicController,
                    title: "clinicName".tr(),
                    icon: Icons.local_pharmacy_outlined,
                    textInputType: TextInputType.name,
                  )
                : widget.role == 4
                    ? EntryFiled(
                        title: "companyName".tr(),
                        icon: Icons.home_work_outlined,
                        textInputType: TextInputType.name,
                      )
                    : SizedBox(),
        EntryFiled(
          controller: _phoneController,
          title: "phone".tr(),
          icon: Icons.phone_android_outlined,
          textInputType: TextInputType.phone,
        ),
        widget.role == 2 || widget.role == 3
            ? EntryFiled(
                enable: false,
                controller: _cardController,
                onTap: () {
                  cardCamera().then((value) {
                    _cardController!.text=cardFile!.path;
                  });
                },
                title: "صورة الكارنية".tr(),
                icon: Icons.camera,
                textInputType: TextInputType.name,
              )
            : SizedBox(),

        widget.role == 2
            ? EntryFiled(
                controller: _specializationController,
                title: "specialization".tr(),
                icon: Icons.star_border_purple500_sharp,
                textInputType: TextInputType.name,
              )
            : SizedBox(),
        EntryFiled(
          controller: _addressController,
          title: widget.role == 4 ? "companyAddress".tr() : "address".tr(),
          icon: Icons.location_on_outlined,
          textInputType: TextInputType.name,
        ),
        widget.role == 3 || widget.role == 4
            ? EntryFiled(
                controller: _licController,
                title: "licenseNumber".tr(),
                icon: Icons.label_important_outline,
                textInputType: TextInputType.name,
              )
            : SizedBox(),


        EntryFiled(
          controller: _emailController,
          title: "email".tr(),
          icon: Icons.email_outlined,
          textInputType: TextInputType.name,
        ),
        EntryFiled(
          controller: _passController,
          title: "password".tr(),
          isPassword: true,
          icon: Icons.password,
          textInputType: TextInputType.visiblePassword,
        ),
        EntryFiled(
          controller: _passConController,
          title: "ConfirmPassword".tr(),
          isPassword: true,
          icon: Icons.password,
          textInputType: TextInputType.visiblePassword,
        ),

        EntryFiled(
          controller: _dateController,
          enable: false,
          onTap: () {
            _submitDate();
            _selectDate(context);
          },
          title: "BirthDay".tr(),
          icon: Icons.calendar_month_outlined,
          textInputType: TextInputType.name,
        ),

        widget.role == 2
            ? Row(
          children: [
            Expanded(
                child: EntryFiled(
                    controller: _startTimeController,
                    icon: Icons.access_time_outlined,
                    onTap: (){
                      _selectStartTime(context);
                    },
                    enable: false,
                    title: 'From',
                    textInputType: TextInputType.datetime)),
            SizedBox(width: 10,),

            Expanded(
                child: EntryFiled(
                    controller: _endTimeController,
                    icon: Icons.access_time_outlined,

                    onTap: (){_selectEndTime(context);},
                    enable: false,
                    title: 'To',
                    textInputType: TextInputType.datetime)),
          ],
        )
            : SizedBox(),
        widget.role == 3
            ? Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        buttonPadding: EdgeInsets.symmetric(horizontal: 10),
                        style: TextStyle(color: Colors.grey),
                        buttonDecoration: BoxDecoration(
                          color: Color(0xfff3f3f4),
                        ),
                        icon: Icon(
                          Icons.delivery_dining,
                          color: secondaryColor,
                        ),
                        isDense: true,
                        isExpanded: true,
                        hint: Text(
                          'خدمة التوصيل',
                          style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: delivery
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedDelivery,
                        onChanged: (value) {
                          setState(() {
                            selectedDelivery = value as String;
                          });
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Future<Object?> cardCamera() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                        const Text(
                          "Camera",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                    onTap: () async {
                      try {
                        final _pickedFile = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                        );
                        cardFile = File(_pickedFile!.path);
                        setState(() {});
                        Navigator.pop(context);
                      } catch (error) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Container(
                  child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.photo,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                          const Text(
                            "Gallery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      onTap: () async {
                        final _pickedFile = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          maxHeight: 400,
                          maxWidth: 400,
                        );
                        cardFile = File(_pickedFile!.path);
                        setState(() {});

                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }


  _selectStartTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);

    setState(() {
      var df = DateFormat("h:mm a");
      var dt = df.parse(formattedTime);
      var finalTime = DateFormat('HH:mm:ss').format(dt);
      _startDate = finalTime;
      _startTimeController.text = _startDate;
    });

  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime(2025),
      firstDate: DateTime(1900),
    );
    setState(() {
      if (selected != null) {
        _selectedDate = DateFormat.yMd().format(selected).toString();
      } else
        _selectedDate = DateFormat.yMd().format(DateTime.now()).toString();
    });

  }

  _submitDate() {
    _dateController.text = _selectedDate;
    setState(() {});
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      var df = DateFormat("h:mm a");
      var dt = df.parse(formattedTime);
      var finalTime = DateFormat('HH:mm:ss').format(dt);

      _endDate = finalTime;
      _endTimeController.text = _endDate;

    });
  }
}
