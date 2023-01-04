import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roshetta_masr/view/pages/Splash_Screen.dart';
import 'package:roshetta_masr/view_model/cubit/_doctor_cubit/doctor_cubit.dart';
import 'package:roshetta_masr/view_model/cubit/sign_up_cubit/sign_up_cubit.dart';

import 'view_model/cubit/language_cubit/language_cubit.dart';
import 'view_model/database/local/cache_helper.dart';
import 'view_model/database/network/dio-helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  await DioHelper.init();
  await CacheHelper.init();

  runApp( EasyLocalization(
    supportedLocales: const [
      Locale('ar'),

      Locale('en'),

    ],
    path: 'assets/translation',
    saveLocale: true,
    startLocale: const Locale('ar'),
    fallbackLocale:const Locale('ar') ,
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return     MultiBlocProvider(

        providers: [
        BlocProvider(create: (context) => LanguageCubit()),
          BlocProvider(create: (context) => DoctorCubit()..allDoctorList),
          BlocProvider(create: (context) => SignupCubit()),


    ],
    child:ScreenUtilInit(
    designSize: const Size(411, 823),
    minTextAdapt: true,
    builder: (BuildContext context, Widget? child) {
      return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    locale: context.locale,
    debugShowCheckedModeBanner: false,
    //Here The Theme.
    title: "Roshetta masr",
    home:  SplashScreen(),

    );
    },
    ));
  }
}
