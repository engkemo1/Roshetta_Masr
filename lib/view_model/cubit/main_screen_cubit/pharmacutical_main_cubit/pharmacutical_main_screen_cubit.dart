import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view_model/cubit/main_screen_cubit/pharmacutical_main_cubit/pharmacutical__main_screen_state.dart';
import '../../../../view/pages/chat_page/chat_page.dart';
import '../../../../view/pages/doctor_pages/doctor_main_screen/doctor_menu_screen.dart';
import '../../../../view/pages/doctor_pages/request_page/requests_screen.dart';
import '../pharmacy_main_screen_cubit/pharmacy_main_screen_state.dart';
class PharmaceuticalMainScreenCubit extends Cubit<PharmaceuticalMainState> {
  PharmaceuticalMainScreenCubit() : super(PharmaceuticalMainInitialState());

  static PharmaceuticalMainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screenList1 =  [
    const ChatPage(),
    // const RequestsScreen(),
    const DoctorMenuScreen(),];

  int index = 0;

  change(int i) {
    index = i;
    emit(PharmaceuticalChangeNavState());
  }
}
