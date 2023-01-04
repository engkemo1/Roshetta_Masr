import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roshetta_masr/view/components/component.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/welcome_page/welcome_page_screen.dart';

import '../../../../../model/auth/login_model.dart';
import '../../../../../view_model/cubit/language_cubit/language_cubit.dart';
import '../../../../../view_model/database/local/cache_helper.dart';
import '../../../../../view_model/utilles/storage.dart';
import '../../../edit_information_screen/edit_information_screen.dart/edit_information_screen.dart';
import '../../appointment_screen.dart';
import '../../cart_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var name =CacheHelper.get(key: 'name');
    var image =CacheHelper.get(key: 'image');
    var email =CacheHelper.get(key: 'email');
    return Scaffold(
      body: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: secondaryColor),
            accountName: Text(
             name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            accountEmail: Text(
              email,
              style: const TextStyle(color: primaryColor),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black38,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            title: Text(
              'editInformation'.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.account_circle_outlined,
              color: secondaryColor,
              size: 30,
            ),
            trailing: IconButton(
                onPressed: () {
                  navigator(context, EditInformationScreen());
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor,
                  size: 30,
                )),
          ),
          Divider(),
          ListTile(
            title: Text(
              'My Appointments'.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.edit_calendar_sharp,
              color: secondaryColor,
              size: 30,
            ),
            trailing: IconButton(
                onPressed: () {
                  navigator(context, Appointment());
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor,
                  size: 30,
                )),
          ),
          Divider(),
          ListTile(
            title: Text(
              'عربة التسوق'.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.shopping_cart_outlined,
              color: secondaryColor,
              size: 30,
            ),
            trailing: IconButton(
                onPressed: () {
                  navigator(context, CartScreen());
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor,
                  size: 30,
                )),
          ),
          Divider(),
          ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(
                              Icons.language,
                              color: secondaryColor,
                            ),
                            title: Text('Arabic'.tr()),
                            onTap: () {
                              context.setLocale(Locale('ar'));

                              Navigator.pop(context);
                            },
                            trailing: context.locale.languageCode == 'ar'
                                ? Icon(
                                    Icons.check_circle,
                                    color: secondaryColor,
                                    size: 30,
                                  )
                                : SizedBox(),
                          ),
                          Divider(),
                          ListTile(
                            leading: const Icon(
                              Icons.language,
                              color: secondaryColor,
                            ),
                            title: Text('English'.tr()),
                            onTap: () {
                              context.setLocale(Locale('en'));

                              Navigator.pop(context);
                            },
                            trailing: context.locale.languageCode == 'en'
                                ? Icon(
                                    Icons.check_circle,
                                    color: secondaryColor,
                                    size: 30,
                                  )
                                : SizedBox(),
                          ),
                        ],
                      );
                    });
              },
              title: Text(
                'Language'.tr(),
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.language,
                color: secondaryColor,
                size: 30,
              ),
              trailing: context.locale.languageCode == 'en'
                  ? Text(
                      'English'.tr(),
                      style: TextStyle(color: secondaryColor),
                    )
                  : Text(
                      'Arabic'.tr(),
                      style: TextStyle(color: secondaryColor),
                    )),
          Divider(),
          ListTile(
            title: Text(
              'LogOut'.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.logout_sharp,
              color: secondaryColor,
              size: 30,
            ),
            trailing: IconButton(
                onPressed: () {
                  removeUser();
                  navigatorAndRemove(context, WelcomePageScreen());
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
