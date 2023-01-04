
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view/pages/doctor_pages/request_page/widget/request_item.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/widget/text.dart';
import '../../../../view_model/cubit/pharmacy_cubit/pharmacy_cubit.dart';
import '../../../../view_model/cubit/pharmacy_cubit/pharmacy_state.dart';
import '../../../../view_model/database/local/cache_helper.dart';
import '../../../constants.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({ Key? key }) : super(key: key);

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        PharmacyCubit()
          ..getOrder(          CacheHelper.get(key: 'id').toString()
          ),
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("طلبات الحجوزات", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: BlocConsumer<PharmacyCubit, PharmacyState>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
    var data = PharmacyCubit.get(context);
    return getBody(  data);

    }
    )
      ));
  }

  getBody(PharmacyCubit data){
    return
      SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextBox(),
                    const SizedBox(height: 20,),
                    getChatList(data)
                  ]
              )
          )
      );
  }

  getChatList(PharmacyCubit data){
    return
      Column(
          children: List.generate(
              data.getOrderList.length,
                  (index) => RequestItem(order: data.getOrderList[index],)
          )
      );
  }
}