import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../../../../model/doctor_information_model.dart';
import '../../../../../../view_model/cubit/_doctor_cubit/doctor_cubit.dart';
import '../../../../../../view_model/cubit/_doctor_cubit/doctor_state.dart';
import '../../../../../components/component.dart';
import '../../../../../constants.dart';
import '../../widget/build_search_widget.dart';
import '../../widget/doctor_box.dart';
import 'doctor_details_screen.dart';

class AllDoctorScreen extends StatefulWidget {
  const AllDoctorScreen({Key? key}) : super(key: key);

  @override
  _AllDoctorScreenState createState() => _AllDoctorScreenState();
}

class _AllDoctorScreenState extends State<AllDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: DoctorCubit()..getAllDoctor(context),
        child: Scaffold(
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
                          'doctors'.tr(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          backgroundImage:
                              AssetImage('assets/icons/doctor.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: buildSearchInput()),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
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
            body: BlocConsumer<DoctorCubit, DoctorState>(
                listener: (context, state) {
              if (state is DoctorLoadingState) {}
            }, builder: (context, state) {
              DoctorCubit cubit = DoctorCubit.get(context);


              return state is DoctorLoadingState
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(backgroundColor: secondaryColor,),
                    )
                  : getBody(cubit);
            })));
  }

  getBody(DoctorCubit cubit) {
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

  getDoctorList(DoctorCubit cubit) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cubit.allDoctorList.length,
      itemBuilder: (BuildContext context, int index) => DoctorBox(
          onTap: () {
            navigator(context, DoctorDetailsScreen(doctor: cubit.allDoctorList[index]));
          },
          index: index,
          doctor: cubit.allDoctorList[index]),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
    );
  }
}
