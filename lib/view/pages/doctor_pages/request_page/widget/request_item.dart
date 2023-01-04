import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/pages/patient_pages/MainScreen/widget/avatar.dart';

import '../../../../../model/get_order_model.dart';
import '../../../../components/ButtonCustom.dart';
import '../../../../components/component.dart';
import '../../../../constants.dart';

class RequestItem extends StatelessWidget {
  RequestItem({Key? key, this.onTap, required this.order}) : super(key: key);
  final OrderData order;
  final GestureTapCallback? onTap;
  var list = [];

  @override
  Widget build(BuildContext context) {
    order.images!.forEach((element) {
      list.add(element.imagePath);
    });

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  order.patient!.imagePath.toString(),
                  radius: 10,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Text(order.patient!.name.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)))),
                        const SizedBox(width: 5),
                        Text(order.createdAt.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(order.patient!.phone!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 13))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))),
              ],
            ),
            Divider(),
            SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      list.length,
                      (index) => InkWell(
                            child: Container(
                              width: 80,
                              child: Image.network(list[index]),
                            ),
                            onTap: () {
                              navigator(context,ViewImage(url:list[index] ,));
                            },
                          )),
                )),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 25,
                  child: ButtonCustom(
                    title: 'رفض',
                    onTap: () {},
                    size: 15,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 100,
                  child: ButtonCustom(
                    size: 15,
                    title: 'موافقة',
                    onTap: () {},
                    color: secondaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      child: Center(
        child: Image.network(url),
      ),
    ),);
  }
}
