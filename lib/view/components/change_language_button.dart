import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view_model/cubit/language_cubit/language_states.dart';

import '../../view_model/cubit/language_cubit/language_cubit.dart';
import '../constants.dart';


class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit,LanguageStates>(
        listener: (context,states){},
    builder: (context, states) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:


      [
        GestureDetector(
            onTap: (){
              LanguageCubit().ChangeLanguage(context,'en');
            },
            child:    Text(
              'EN',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22,
                color: context.locale.languageCode=='en'?primaryColor:Colors.white,
                letterSpacing: 1.1,
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            )),
        const SizedBox(width: 10,),
        Container(height: 20,width: 2,color: primaryColor,),
        SizedBox(width: 10,),

        GestureDetector(
          onTap: (){
            LanguageCubit().ChangeLanguage(context,'ar');

          },
          child:  Text(
            'AR',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              color: context.locale.languageCode=='ar'?primaryColor:Colors.white,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
      ],);});
  }
}

