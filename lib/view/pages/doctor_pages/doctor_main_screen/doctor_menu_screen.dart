import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta_masr/view/components/component.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/welcome_page/welcome_page_screen.dart';

import '../../../../view_model/database/local/cache_helper.dart';
import '../../edit_information_screen/edit_information_screen.dart/edit_information_screen.dart';


class DoctorMenuScreen extends StatelessWidget {
  const DoctorMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const  UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: secondaryColor
            ),
            accountName: Text('kemo',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),), accountEmail: Text('kemo@gmail.com',style: TextStyle(color: primaryColor),)
            , currentAccountPicture: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black38,
            backgroundImage: AssetImage('assets/icons/doctor.png'),
          ),
          ),
          SizedBox(height: 15,),
          ListTile(
            title: Text('editInformation'.tr(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
            leading: const Icon(Icons.account_circle_outlined,color: secondaryColor,size: 30,),
            trailing: IconButton(onPressed: (){
              navigator(context, EditInformationScreen());
            }, icon: Icon(Icons.arrow_forward_ios,color: secondaryColor,size: 30,)),


          ),

          Divider(),
          ListTile(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.language,color: secondaryColor,),
                          title:  Text('Arabic'.tr()),
                          onTap: () {
                            context.setLocale(Locale('ar'));

                            Navigator.pop(context);
                          },
                          trailing: context.locale.languageCode=='ar'?Icon(Icons.check_circle,color: secondaryColor,size: 30,):SizedBox(),
                        ),
                        Divider(),
                        ListTile(
                          leading:  const Icon(Icons.language,color: secondaryColor,),
                          title:  Text('English'.tr()),
                          onTap: () {
                            context.setLocale(Locale('en'));

                            Navigator.pop(context);
                          },
                          trailing: context.locale.languageCode=='en'?Icon(Icons.check_circle,color: secondaryColor,size: 30,):SizedBox(),

                        ),


                      ],
                    );
                  });
            },
            title: Text('Language'.tr(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
            leading: const Icon(Icons.language,color: secondaryColor,size: 30,),
            trailing:context.locale.languageCode=='en'? Text('English'.tr(),style:  TextStyle(color: secondaryColor),):Text('Arabic'.tr(),style: TextStyle(color: secondaryColor),)


          ),
          Divider(),
          ListTile(
            title: Text('LogOut'.tr(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
            leading: const Icon(Icons.logout_sharp,color: secondaryColor,size: 30,),
            trailing: IconButton(onPressed: (){
              CacheHelper.removeData(key: 'DoctorToken');

              navigatorAndRemove(context, WelcomePageScreen());
            }, icon: Icon(Icons.arrow_forward_ios,color: secondaryColor,size: 30,)),


          ),],



      ),
    );
  }
}
