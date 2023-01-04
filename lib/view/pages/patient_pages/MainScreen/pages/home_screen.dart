import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roshetta_masr/model/auth/login_model.dart';
import 'package:roshetta_masr/view/components/component.dart';

import '../../../../../view_model/cubit/home_cubit/home_cubit.dart';
import '../../../../../view_model/cubit/home_cubit/home_state.dart';
import '../../../../../view_model/database/local/cache_helper.dart';
import '../../../../../view_model/utilles/storage.dart';
import '../../../../components/app_tittle.dart';
import '../../../../constants.dart';
import '../../../categories/category_screen.dart';
import '../widget/build_colored_card2.dart';
import '../widget/build_search_widget.dart';
import '../widget/offer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name =CacheHelper.get(key: 'name');
    var image =CacheHelper.get(key: 'image');
    return Scaffold(
        body: BlocProvider(
            create: (context) => HomeCubit()..category(context),
            child: BlocConsumer<HomeCubit, HomeState>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  var data = HomeCubit.get(context);
                  return ConditionalBuilder(
                      fallback: (BuildContext context) => const Center(
                              child: CircularProgressIndicator.adaptive(
                            backgroundColor: secondaryColor,
                          )),
                      condition: data.categoryList != null,
                      builder: (context) {
                        return SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  color: secondaryColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          title(size: 18),
                                          // SizedBox(
                                          //   child: Image.asset(
                                          //
                                          //       'assets/images/logo1.png',height: 50,),
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                      image??''))),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat.yMMMMd()
                                                    .format(DateTime.now())
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'hi'.tr(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    ',${name}!',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      buildSearchInput(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CarouselSlider(
                                  options: CarouselOptions(
                                      height: 100.0, autoPlay: true),
                                  items: const [
                                    OfferCardWidget(
                                      cardImg: 'assets/images/offer2.jpg',
                                      title: '',
                                      offer: '',
                                    ),
                                    OfferCardWidget(
                                      cardImg: 'assets/images/offer3.jpg',
                                      title: '',
                                      offer: '',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    runSpacing: 20,
                                    spacing: 20,
                                    verticalDirection: VerticalDirection.down,
                                    children: [
                                      ...List.generate(
                                          data.categoryList.length,
                                          (index) => buildColoredCard2(
                                              title: data
                                                  .categoryList[index].name!,
                                              image: data.categoryList[index]
                                                  .iconPath!,
                                              onTap: () {
                                                navigator(
                                                    context,
                                                    CategoryScreen(
                                                      name: data
                                                          .categoryList[index]
                                                          .name!,
                                                      id: data
                                                          .categoryList[index]
                                                          .id
                                                          .toString(),
                                                    ));
                                              }))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                })));
  }
}
