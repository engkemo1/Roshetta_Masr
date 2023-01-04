import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/cubit/main_screen_cubit/pharmacutical_main_cubit/pharmacutical__main_screen_state.dart';
import '../../../../view_model/cubit/main_screen_cubit/pharmacutical_main_cubit/pharmacutical_main_screen_cubit.dart';

class PharmaceuticalMainScreen extends StatelessWidget {
  const PharmaceuticalMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return PharmaceuticalMainScreenCubit();
        },
        child: BlocConsumer<PharmaceuticalMainScreenCubit, PharmaceuticalMainState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return Scaffold(
              body: PharmaceuticalMainScreenCubit.get(context)
                  .screenList1[PharmaceuticalMainScreenCubit.get(context).index],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.black,
                currentIndex: PharmaceuticalMainScreenCubit.get(context).index,
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
                  PharmaceuticalMainScreenCubit.get(context).change(index);
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
