import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view/pages/patient_pages/MainScreen/pages/all_doctor_screen/all_doctor_screen.dart';
import '../../../../view/pages/patient_pages/MainScreen/pages/home_screen.dart';
import '../../../../view/pages/patient_pages/MainScreen/pages/labs_screen/labs_screen.dart';
import '../../../../view/pages/patient_pages/MainScreen/pages/menu_scrreen.dart';
import '../../../../view/pages/patient_pages/MainScreen/pages/pharmacy_screen/pharmacy_screen.dart';
import 'patient_main_screen_state.dart';

class PatientMainScreenCubit extends Cubit<PatientMainState> {
  PatientMainScreenCubit() : super(MainInitialState());

  static PatientMainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screenList1 = [
     HomeScreen(),
    const AllDoctorScreen(),
    const PharmacyScreen(),
    const LabsScreen(),
    const MenuScreen(),
  ];

  int index = 0;

  change(int i) {
    index = i;
    emit(ChangeNavState());
  }
}
