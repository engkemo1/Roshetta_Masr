import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta_masr/view/constants.dart';

import '../../../view_model/cubit/home_cubit/home_cubit.dart';
import '../../../view_model/cubit/home_cubit/home_state.dart';
import '../../components/component.dart';
import '../patient_pages/MainScreen/widget/build_colored_card2.dart';
import '../item_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.name, required this.id})
      : super(key: key);
  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text(name),
        ),
        body: BlocProvider(
            create: (context) => HomeCubit()..subCategory(id, context),
            child: BlocConsumer<HomeCubit, HomeState>(
                listener: (BuildContext context, state) {},
                builder: (BuildContext context, state) {
                  var data = HomeCubit.get(context);
                  return ConditionalBuilder(
                      fallback: (BuildContext context) => Center(
                              child: CircularProgressIndicator.adaptive(
                            backgroundColor: secondaryColor,
                          )),
                      condition: state is SubCSuccessState,
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 5 / 4),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return buildColoredCard2(
                                        title:
                                            data.subCategoryList[index].name!,
                                        image: data
                                            .subCategoryList[index].iconPath!,
                                        onTap: () {
                                          navigator(
                                              context,
                                               ItemCategory(
                                                id: data
                                                    .subCategoryList[index].id!
                                                    .toString(),
                                                name: data
                                                    .subCategoryList[index]
                                                    .name!
                                                    .toString(),
                                              ));
                                        });
                                  },
                                  itemCount: data.subCategoryList.length,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                })));
  }
}
