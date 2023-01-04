import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view_model/cubit/sign_up_cubit/sign_up_state.dart';

import '../../../model/auth/city_model.dart';
import '../../../model/auth/login_model.dart';
import '../../../view/components/component.dart';
import '../../../view/pages/doctor_pages/doctor_main_screen/doctor_main_screen.dart';
import '../../../view/pages/patient_pages/MainScreen/MainScreen.dart';
import '../../../view/pages/pharmacy_pages/main_screen/pharmacy_main_screen.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/dio_exceptions.dart';
import '../../database/network/end_points.dart';
import '../../utilles/storage.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(intiStateSignup());

  static SignupCubit GetInstence(context) => BlocProvider.of(context);

  // RegisterModel? Model;
  LoginData loginModel=LoginData() ;

  signUp(
      BuildContext context,
      String name,
      String email,
      String password,
      String coPassword,
      String areaId,
      String gender,
      String address,
      String phone,
      String bd,
      String? clinic,
      String? specialization,
      String? from,
      String? to,
      File? card,
      String license_number,
      String delivery,
      File imageFile,
      int roleId) async {
    emit(SignupLoading());

    try {
      String fileName = imageFile.path.split('/').last;
      String cardName = card != null ? card.path.split('/').last : "";

      String url = roleId == 1
          ? 'patient-register'
          : roleId == 2
              ? 'doctor-register'
              : 'pharmacy-register';
      FormData formData = FormData.fromMap({
        'name': name,
        "email": email,
        'password': password,
        "password_confirmation": coPassword,
        "area_id": areaId,
        "gender": gender,
        "address": address,
        "phone": phone,
        'bd': '2022/12/6',
        "photo":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });
      FormData formDataDoctor = FormData.fromMap({
        'name': name,
        "email": email,
        'password': password,
        "password_confirmation": coPassword,
        "area_id": areaId,
        "gender": gender,
        "address": address,
        "phone": phone,
        'clinic': clinic,
        'specialization': specialization,
        'from': '01:02',
        'to': "01:03",
        'bd': '2022/12/6',
        "card": card == null
            ? ''
            : await MultipartFile.fromFile(card.path, filename: cardName),
        "doctor_card": card == null
            ? ''
            : await MultipartFile.fromFile(card.path, filename: cardName),
        "photo":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });
      FormData formDataPharmacy = FormData.fromMap({
        'name': name,
        "email": email,
        'password': password,
        "password_confirmation": coPassword,
        "area_id": areaId,
        "gender": gender,
        "address": address,
        "phone": phone,
        'license_number': license_number,
        'from': '01:02',
        'to': "01:03",
        "delivery": delivery,
        'bd': '2022/12/6',
        "card": card == null
            ? ''
            : await MultipartFile.fromFile(card!.path, filename: cardName),
        "photo":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      await Dio()
          .post("https://roshettamisr.com/api/$url",
              data: roleId == 1
                  ? formData
                  : roleId == 2
                      ? formDataDoctor
                      : formDataPharmacy,
              options: Options(headers: {"Accept": "application/json"}))
          .then((value) {

        if (roleId == 1) {
          loginModel=LoginData.fromJson(value.data['data']);

          CacheHelper.put(key: 'id', value: loginModel.id);
          CacheHelper.put(key: 'name', value: loginModel.name);
          CacheHelper.put(key: 'image', value: loginModel.image);
          CacheHelper.put(key: 'email', value: loginModel.email);
          CacheHelper.put(key: 'token', value: value.data['token']);
          navigatorAndRemove(context, MainScreen());
        } else if (roleId == 2) {
          // CacheHelper.put(key: 'DoctorToken', value: value.data['token']);
          // navigatorAndRemove(context, DoctorMainScreen());

        }else if(roleId == 3){
          // CacheHelper.put(key: 'PharmacyToken', value: value.data['token']);
          // navigatorAndRemove(context, const PharmacyMainScreen());


        }
        showToast(message: value.data['message'], color: secondaryColor);

        emit(SignupSuccess());
      });
    } on DioError catch (e) {
      showToast(message: e.response!.data['message'], color: Colors.red);
      print(e.response!.data['message']);
      emit(SignupError(e));
    }
  }

  Future<List<CityData>> getArea() async {
    emit(AreaLoading());
    List<CityData> cityModelList = [];

    try {
      var response = await DioHelper.getData(
        url: city,
      );
      if (response.statusCode == 200) {
        var responseBody = response.data['data'];

        cityModelList =
            (responseBody as List).map((e) => CityData.fromJson(e)).toList();
        print(response.data['data']);
        emit(AreaSuccess());
        return cityModelList;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(message: errorMessage, color: Colors.red);
      emit(AreaError(e));

      throw errorMessage;
    }
    return cityModelList;
  }
}
