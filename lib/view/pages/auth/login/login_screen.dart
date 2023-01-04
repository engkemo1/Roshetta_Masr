import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view/components/component.dart';
import 'package:roshetta_masr/view/constants.dart';
import 'package:roshetta_masr/view/pages/auth/widget/baziier_container.dart';
import 'package:roshetta_masr/view_model/cubit/login_cubit/login_cubit.dart';
import 'package:roshetta_masr/view_model/cubit/login_cubit/login_state.dart';

import '../../../../view_model/database/local/cache_helper.dart';
import '../../../components/app_tittle.dart';
import '../../doctor_pages/doctor_main_screen/doctor_main_screen.dart';
import '../../patient_pages/MainScreen/MainScreen.dart';
import '../../welcome_page/welcome_page_screen.dart';
import '../sign_up/signup_screen.dart';
import '../widget/divider.dart';
import '../widget/entry_field.dart';
import '../widget/submit.dart';
import '../widget/text_account.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title, required this.role}) : super(key: key);
  final int role;

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Duration duration = const Duration(milliseconds: 800);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        EntryFiled(
          controller: emailController,
          title: "email".tr(),
          icon: Icons.email_outlined,
          textInputType: TextInputType.emailAddress,
        ),
        EntryFiled(
          controller: passController,
          title: "password".tr(),
          isPassword: true,
          icon: Icons.password,
          textInputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: secondaryColor,
        body: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginMainState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = LoginCubit.get(context);

                  return SafeArea(
                      child: Container(
                    height: height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: -height * .15,
                            right: -MediaQuery.of(context).size.width * .4,
                            child: BezierContainer()),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: height * .2),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: title(),
                                ),
                                const SizedBox(height: 70),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: _emailPasswordWidget(),
                                ),
                                const SizedBox(height: 20),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: SubmitButton(
                                    onTap: () {


                                       cubit.login(emailController.text,
                                            passController.text, context,widget.role);

                                    },
                                  ),
                                ),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    alignment: Alignment.centerRight,
                                    child: Text('forgetPassword'.tr(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: divider(),
                                ),
                                FadeInUp(
                                  duration: duration,
                                  delay: const Duration(milliseconds: 600),
                                  child: createAccountLabel(
                                      widget.role,
                                      context,
                                      'DontHaveAccount'.tr(),
                                      RegisterScreen(
                                        role: widget.role,
                                      ),
                                      'register'.tr()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                onPressed: () {
                                  navigatorAndRemove(
                                      context, WelcomePageScreen());
                                },
                              ),
                            )),
                      ],
                    ),
                  ));
                })));
  }
}
