import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roshetta_masr/view_model/cubit/pharmacy_cubit/pharmacy_state.dart';
import '../../../model/all_doctor_model.dart';
import '../../../model/get_order_model.dart';
import '../../../view/components/component.dart';
import '../../../view/constants.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/dio_exceptions.dart';
import '../../database/network/end_points.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyInitialState());

  static PharmacyCubit get(context) => BlocProvider.of(context);
  List<Data> allPharmacyList = [];
  List<  OrderData> getOrderList = [];

  String token = CacheHelper.get(key: 'token')??'';
  String pharmacyToken = CacheHelper.get(key: 'PharmacyToken')??'';

  Future getAllPharmacy(BuildContext context) async {
    emit(PharmacyLoadingState());
    try {
      var response =
          await DioHelper.postData(url: allPharmacy, data: {}, token: token);
      if (response.statusCode == 200) {
        var responseBody = response.data['data'];

        allPharmacyList =
            (responseBody as List).map((e) => Data.fromJson(e)).toList();

        emit(PharmacySuccessState());
      }
    } on DioError catch (e) {
      print(e.response!.data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(
        message: errorMessage,
        color: Colors.red,
      );
      emit(PharmacyErrorState(e));

      throw errorMessage;
    }
  }

  makeOrder(String pId, String phId, String desc, List<File>? image) async {
    emit(MakeOrderLoadingState());

    try {
      List<dynamic>? _documents = [];

      for(int i=0; i< image!.length; i++ ){
        var path = image[i].path;
        _documents.add(await MultipartFile.fromFile(path,
            filename: path.split('/').last));
      }
      FormData formDataPharmacy = FormData.fromMap({
        'patient_id': pId,
        "pharmacy_id": phId,
        'description': desc,
        "images[]": _documents,
      });


      await Dio()
          .post("https://roshettamisr.com/api/order",
              data: formDataPharmacy,
              options: Options(headers: {
                "Accept": "application/json",
                'Authorization': 'Bearer ${token ?? ''}'
              }))
          .then((value) {
        showToast(message: value.data['message'], color: secondaryColor);

        emit(MakeOrderSuccessState());
      });
    } on DioError catch (e) {
      print(e.response!.data['message']);
      showToast(message: e.response!.data['message'], color: Colors.red);
      emit(MakeOrderErrorState(e));
    }
  }

  getOrder(String id) async {
    emit(GetOrderLoadingState());
    print(pharmacyToken);
    try {
      print(CacheHelper.get(key: 'id'));
      var response =
          await Dio().post( 'https://roshettamisr.com/api/all-pharmacy-order/$id', data: {},options: Options(headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer ${pharmacyToken ?? ''}'
          })  );
      if (response.statusCode == 200) {
        var responseBody = response.data['data'];

        getOrderList =
            (responseBody as List).map((e) => OrderData.fromJson(e)).toList();

        emit(GetOrderSuccessState());
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(e.response);
      showToast(
        message: errorMessage,
        color: Colors.red,
      );
      emit(GetOrderErrorState(e));

      throw errorMessage;
    }
  }
}
