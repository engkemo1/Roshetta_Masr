import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view_model/cubit/login_cubit/login_state.dart';

import '../../../model/all_doctor_model.dart';
import '../../../model/lab_model.dart';
import '../../../view/components/component.dart';
import '../../../view/pages/patient_pages/MainScreen/MainScreen.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/dio_exceptions.dart';
import '../../database/network/end_points.dart';
import 'lab_state.dart';

class LabCubit extends Cubit<LabState> {
  LabCubit() : super(LabInitialState());

  static LabCubit get(context) => BlocProvider.of(context);
  List<LabData>  allLabList=[] ;

  String token=  CacheHelper.get(key: 'token');

  Future getAllLabs(
      BuildContext context) async {
    emit(LabLoadingState());
    try {
      var response = await DioHelper.postData(
          url: allLab, data: {},token: token
      );
      if (response.statusCode == 200) {

        var responseBody = response.data['data'];

        allLabList=
            (responseBody as List).map((e) => LabData.fromJson(e)).toList();

        emit(LabSuccessState());
      }
    } on DioError catch (e) {
      print(e.response!.data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(message: errorMessage, color: Colors.red);
      emit(LabErrorState(e));

      throw errorMessage;

    }
  }
}
