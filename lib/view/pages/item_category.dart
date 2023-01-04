import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roshetta_masr/view/components/ButtonCustom.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/widget/build_search_widget.dart';
import '../../view_model/cubit/home_cubit/home_cubit.dart';
import '../../view_model/cubit/home_cubit/home_state.dart';
import '../constants.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({Key? key, required this.name, required this.id}) : super(key: key);
  final String name;
  final String id;
  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;

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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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
      body:BlocProvider(
    create: (context) => HomeCubit()..Product(widget.id, context),
    child: BlocConsumer<HomeCubit, HomeState>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
    var data = HomeCubit.get(context);
    return ConditionalBuilder(
    fallback: (BuildContext context) => Center(
    child: CircularProgressIndicator.adaptive(
    backgroundColor: secondaryColor,
    )),
    condition: state is ProductSuccessState,
    builder: (context) {
    return  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: data.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) => itemCategory(
                          () {
                            buildShowModalBottomSheet(context);
                          },
                          data.productList[index].imagePath!,
                      data.productList[index].name!,
                        )))
          ],
        ),
      );});}))
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,

        builder: (context) {
          return SizedBox(

            height: 600,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    imageAssetBuild('provir.jpg'),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:const Icon(Icons.cancel_outlined,color: secondaryColor,size: 30,))

                  ],
                ),
                SizedBox(height: 10,),
Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:                 Text('''
دواعي الإستعمال:

نقص الحديد أثناء النمو أو الحمل أو الرضاعة.
فقر الدم الشديد والخبيث.
نقص الحديد أثناء العلاج طويل الأمد لمركبات الكورتيزون ، وفي حالات نقص إفراز الغدة الجار درقية.
فقر الدم الناجم عن نقص الحديد
''',style: TextStyle(fontSize: 14),),
    ),
                SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:  SizedBox(
                  height: 40,
                  child: ButtonCustom(
                    icon: Icons.add_shopping_cart_rounded,
                    iconSize: 15,
                    title: 'اضافة',
                    onTap: () {},
                    size: 13,
                    color: secondaryColor,
                  ),
            ) ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }

  itemCategory(void Function() onTap, String image, String title) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shadowColor: primaryColor,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image),
              SizedBox(height: 15.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "السعر:22",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '\8.99',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
                child: ButtonCustom(
                  icon: Icons.add_shopping_cart_rounded,
                  iconSize: 15,
                  title: 'اضافة',
                  onTap: () {},
                  size: 13,
                  color: secondaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
