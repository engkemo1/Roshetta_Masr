import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/cubit/main_screen_cubit/doctor_main_screen_cubit/doctor_main_screen_cubit.dart';
import '../../../../view_model/cubit/main_screen_cubit/doctor_main_screen_cubit/doctor_main_screen_state.dart';

class LabMainScreen extends StatelessWidget {
  const LabMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return DoctorMainScreenCubit();
        },
        child: BlocConsumer<DoctorMainScreenCubit, DoctorMainState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return Scaffold(
              body: DoctorMainScreenCubit.get(context)
                  .screenList1[DoctorMainScreenCubit.get(context).index],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.black,
                currentIndex: DoctorMainScreenCubit.get(context).index,
                items: [
                  buildBottomNavigationBarItem(
                      const Icon(
                        Icons.chat_outlined,
                      ),
                      Text(
                        'الرسائل'.tr(),
                        style:const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                  buildBottomNavigationBarItem(
                      const Icon(Icons.request_quote_outlined),
                      Text(
                        'طلبات الحجوزات'.tr(),
                        style:const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )),

                  buildBottomNavigationBarItem(
                      const Icon(
                        Icons.account_circle_outlined,
                      ),
                      Text('profile'.tr(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.bold))),
                ],
                onTap: (index) {
                  DoctorMainScreenCubit.get(context).change(index);
                },
              ),
            );
          },
        ));
  }
}
BottomNavigationBarItem buildBottomNavigationBarItem(
    Widget icon,
    Widget activeIcon,
    ) {
  return BottomNavigationBarItem(
    backgroundColor: secondaryColor,
    activeIcon: activeIcon,
    icon: icon,
    label: "",
  );
}
