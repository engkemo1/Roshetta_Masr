import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view/pages/chat_page/chat_page.dart';
import '../../../../view/pages/doctor_pages/doctor_main_screen/doctor_menu_screen.dart';
import '../../../../view/pages/doctor_pages/request_page/requests_screen.dart';
import '../../../../view/pages/pharmacy_pages/main_screen/pharmacy_menu_screen.dart';
import '../pharmacy_main_screen_cubit/pharmacy_main_screen_state.dart';
class PharmacyMainScreenCubit extends Cubit<PharmacyMainState> {
  PharmacyMainScreenCubit() : super(PharmacyMainInitialState());

  static PharmacyMainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screenList1 =  [
    const ChatPage(),
    const RequestsScreen(),
    const PharmacyMenuScreen(),];

  int index = 0;

  change(int i) {
    index = i;
    emit(PharmacyChangeNavState());
  }
}
