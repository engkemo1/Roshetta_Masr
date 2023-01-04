import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view_model/cubit/main_screen_cubit/main_screen_patient_cubit/patient_main_screen_cubit.dart';
import '../../../../view_model/cubit/main_screen_cubit/main_screen_patient_cubit/patient_main_screen_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return PatientMainScreenCubit();
        },
        child: BlocConsumer<PatientMainScreenCubit, PatientMainState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            return Scaffold(
              body: PatientMainScreenCubit.get(context)
                  .screenList1[PatientMainScreenCubit.get(context).index],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.black,
                currentIndex: PatientMainScreenCubit.get(context).index,
                items: [
                  buildBottomNavigationBarItem(
                      const Icon(
                        Icons.home,
                      ),
                       Text(
                        'home'.tr(),
                        style:const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                  buildBottomNavigationBarItem(
                      const Icon(Icons.medical_services_outlined),
                       Text(
                        'doctors'.tr(),
                        style:const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                  buildBottomNavigationBarItem(
                      const Icon(Icons.local_pharmacy_outlined),
                       Text(
                        'pharmacies'.tr(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                  buildBottomNavigationBarItem(
                      const Icon(Icons.health_and_safety_outlined),
                      Text(
                        'Labs'.tr(),
                        style: const TextStyle(
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
                  PatientMainScreenCubit.get(context).change(index);
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
