
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'language_states.dart';


class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(Intistate());

  void ChangeLanguage(BuildContext context,String countryCode){

    context.setLocale(Locale(countryCode));
    emit(LanguageStatesSuccess());

  }


}
