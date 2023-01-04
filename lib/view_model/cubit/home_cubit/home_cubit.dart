
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/home_model/category/category_model.dart';
import '../../../model/home_model/category/product_model.dart';
import '../../../model/home_model/category/sub_category_model.dart';
import '../../../view/components/component.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio-helper.dart';
import '../../database/network/dio_exceptions.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<CategoryData>  categoryList=[] ;
  List<SubData>  subCategoryList=[] ;
  List<ProductData>  productList=[] ;

  String token=  CacheHelper.get(key: 'token');

  Future category(
      BuildContext context) async {
    emit(HomeLoadingState());
    try {
      var response = await DioHelper.postData(
          url: 'category', data: {},token: token
      );
      if (response.statusCode == 200) {

        var responseBody = response.data['data'];
print(response.data['message']);
        categoryList=
            (responseBody as List).map((e) => CategoryData.fromJson(e)).toList();
        emit(HomeSuccessState());

      }

    } on DioError catch (e) {
      print(e.response!.data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(message: errorMessage, color: Colors.red);
      emit(HomeErrorState(e));

      throw errorMessage;

    }
  }
  Future subCategory(String id,
      BuildContext context) async {
    emit(SubCLoadingState());
    try {
      var response = await DioHelper.postData(
          url: 'supcategory/$id', data: {},token: token
      );
      if (response.statusCode == 200) {

        var responseBody = response.data['data'];
        print(response.data['message']);
        subCategoryList=
            (responseBody as List).map((e) => SubData.fromJson(e)).toList();
        emit(SubCSuccessState());

      }

    } on DioError catch (e) {
      print(e.response!.data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(message: errorMessage, color: Colors.red);
      emit(SubCErrorState(e));

      throw errorMessage;

    }
  }
  Future Product(
      String id,
      BuildContext context) async {
    emit(ProductLoadingState());
    try {
      var response = await DioHelper.postData(
          url: 'product/$id', data: {},token: token
      );
      if (response.statusCode == 200) {

        var responseBody = response.data['data'];
        print(response.data['message']);
        productList=
            (responseBody as List).map((e) => ProductData.fromJson(e)).toList();
        emit(ProductSuccessState());

      }

    } on DioError catch (e) {
      print(e.response!.data);
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showToast(message: errorMessage, color: Colors.red);
      emit(ProductErrorState(e));

      throw errorMessage;

    }
  }
}
