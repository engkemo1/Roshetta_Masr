
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class SelectDate extends StatefulWidget {
  var startTimeFunction;
  var  endTimeFunction;
  final String endTime;
  final String startTime;

   SelectDate({Key? key, required this.startTime, required this.endTime, required this.startTimeFunction, required this.endTimeFunction}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
 return   Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                enabled: false,
                controller: _startTimeController..text=widget.startTime,
                keyboardType: TextInputType.datetime,
                style: TextStyle(color: Colors.grey),

                decoration: InputDecoration(
                  label: Text(
                    'from'.tr(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.access_time,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      widget.startTimeFunction;
                    },
                  ),
                ),

              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
                  controller: _endTimeController..text=widget.startTime,
                  keyboardType: TextInputType.datetime,
                  enabled: false,
                  style: TextStyle(color: Colors.grey),

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true,
                    label: Text(
                      'to'.tr(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    suffixIcon:  IconButton(
                      icon: const Icon(
                        Icons.access_time,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        widget.endTimeFunction;
                      },
                    ),

                  )))
        ],
      ),
    );  }

}
