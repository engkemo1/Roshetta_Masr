import 'package:badges/badges.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/doctor_information_model.dart';
import '../../../../../../view_model/cubit/lab_cubit/lab_cubit.dart';
import '../../../../../../view_model/cubit/lab_cubit/lab_state.dart';
import '../../../../../components/component.dart';
import '../../../../../constants.dart';
import '../../widget/build_search_widget.dart';
import '../../widget/labsBox.dart';
import 'labs_screen_details.dart';

class LabsScreen extends StatefulWidget {
  const LabsScreen({Key? key}) : super(key: key);

  @override
  _LabsScreenState createState() => _LabsScreenState();
}

class _LabsScreenState extends State<LabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(80, MediaQuery.of(context).size.width),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 170,
          decoration: BoxDecoration(color: secondaryColor),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Labs'.tr(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    backgroundImage: AssetImage('assets/icons/doctor.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(child: buildSearchInput()),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body:  BlocProvider(
          create: (context) =>
         LabCubit()
            ..getAllLabs(context),
          child: BlocConsumer<LabCubit, LabState>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, state) {
                var data = LabCubit.get(context);
                return ConditionalBuilder(
                    fallback: (BuildContext context) =>
                        Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: secondaryColor,)

                        ),
                    condition: data
                        .allLabList!=null,
                    builder: (context) {
                      return getBody(data);
                    });
              }
          )));
  }

  }

  getBody(LabCubit cubit) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              getDoctorList(cubit)
            ])));
  }

  getDoctorList(LabCubit cubit) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cubit.allLabList.length,
      itemBuilder: (BuildContext context, int index) =>
          LabsBox(onTap: () {
            navigator(context, LabsScreenDetails(lab: cubit.allLabList[index]));

          }, index: index, lab: cubit.allLabList[index],),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
    );
  }

