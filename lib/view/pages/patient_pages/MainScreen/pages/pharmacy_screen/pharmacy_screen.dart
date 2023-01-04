import 'package:badges/badges.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/pages/pharmacy_screen/pharmacy_details_screen.dart';
import '../../../../../../model/doctor_information_model.dart';
import '../../../../../../view_model/cubit/pharmacy_cubit/pharmacy_cubit.dart';
import '../../../../../../view_model/cubit/pharmacy_cubit/pharmacy_state.dart';
import '../../../../../components/component.dart';
import '../../../../../constants.dart';
import '../../widget/build_search_widget.dart';
import '../../widget/pharmacyBox.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  _PharmacyScreenState createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(80, MediaQuery
              .of(context)
              .size
              .width),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 170,
            decoration: BoxDecoration(color: secondaryColor),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'pharmacies'.tr(),
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
        body: BlocProvider(
            create: (context) =>
            PharmacyCubit()
              ..getAllPharmacy(context),
        child: BlocConsumer<PharmacyCubit, PharmacyState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              var data = PharmacyCubit.get(context);
              return ConditionalBuilder(
                  fallback: (BuildContext context) =>
                      Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: secondaryColor,)

                      ),
                  condition: data
                      .allPharmacyList != null,
                  builder: (context) {
                    return getBody(  data);
                  });
            }
    )));
  }
}

getBody(PharmacyCubit cubit) {
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

getDoctorList(PharmacyCubit cubit) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: cubit.allPharmacyList.length,
    itemBuilder: (BuildContext context, int index) =>
        PharmacyBox(onTap: () {
          navigator(context,  PharmacyDetailsScreen(data: cubit.allPharmacyList[index],));
        },
          index: index,
          doctor: cubit.allPharmacyList[index],
          image: 'assets/images/pharmacy.jpg',),
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
  );
}
