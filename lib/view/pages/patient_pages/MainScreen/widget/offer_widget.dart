import 'package:flutter/material.dart';



class OfferCardWidget extends StatefulWidget {
  final String cardImg;
  final String title;
  final String offer;

  const OfferCardWidget({ required this.cardImg, required this.title, required this.offer}) ;

  @override
  _OfferCardWidgetState createState() => _OfferCardWidgetState();
}

class _OfferCardWidgetState extends State<OfferCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(left: 10,right: 10),
      width: MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              image: AssetImage(widget.cardImg),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
