
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../widgets/profile_widget.dart';
import '../widgets/text_filed.dart';

class EditInformationScreen extends StatelessWidget {
  const EditInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text('تعديل الملف الشخصي'),
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: 'assets/icons/doctor.png',
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'الاسم',
            text: 'kamal',
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'البريد الالكتروني',
            text: 'kemo@gmail.com',
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'رقم الهاتف',
            text: '12123211',
            onChanged: (email) {},
          ),
          TextFieldWidget(
            label: 'العنوان',
            text: 'بنها',
            onChanged: (email) {},
          ),
          const SizedBox(height: 10),

        ],
      ),


    );
  }
}
