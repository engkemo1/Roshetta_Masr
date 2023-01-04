import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roshetta_masr/view/pages/doctor_pages/doctor_main_screen/doctor_main_screen.dart';
import 'package:roshetta_masr/view_model/cubit/login_cubit/login_state.dart';

import '../../../model/auth/login_model.dart';
import '../../../view/components/component.dart';
import '../../../view/constants.dart';
import '../../../view/pages/patient_pages/MainScreen/MainScreen.dart';
import '../../../view/pages/pharmacy_pages/main_screen/pharmacy_main_screen.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/dio_exceptions.dart';
import '../../database/network/end_points.dart';
import '../../utilles/storage.dart';

class LoginCubit extends Cubit<LoginMainState> {
  LoginCubit() : super(LoginMainInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginData loginModel=LoginData() ;

  Future login(
      String email, String password, BuildContext context, int roleId) async {
    emit(LoginLoadingState());
    try {
      var response = await DioHelper.postData(
          url:roleId == 1? patientLogin:roleId == 2?doctorLogin:pharmacyLogin, data: {'email': email, 'password': password});
      if (response.data['message'] == 'Login Successful') {
        showToast(message: response.data['message'], color: secondaryColor);
        var responseBody =response.data['data'];
        loginModel=LoginData.fromJson(response.data['data']);

        CacheHelper.put(key: 'id', value: loginModel.id);
        CacheHelper.put(key: 'name', value: loginModel.name);
        CacheHelper.put(key: 'status', value: loginModel.status);
        CacheHelper.put(key: 'image', value: loginModel.image);
        CacheHelper.put(key: 'email', value: loginModel.email);
        if (roleId == 1) {

          CacheHelper.put(key: 'token', value: response.data['token']);
          navigatorAndRemove(context, MainScreen());
        } else if (roleId == 2) {
          CacheHelper.put(key: 'DoctorToken', value: response.data['token']);
          navigatorAndRemove(context, DoctorMainScreen());
        }else if (roleId == 3){

          CacheHelper.put(key: 'PharmacyToken', value: response.data['token']);
          navigatorAndRemove(context, PharmacyMainScreen());
        }
        emit(LoginSuccessState());
      } else {}
    } on DioError catch (e) {
      showToast(message: e.response!.data['message'], color: Colors.red);
      emit(LoginErrorState(e));
    }
  }
}
