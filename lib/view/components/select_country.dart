

import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';
class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
   String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
              flagSize: 25,
              backgroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
              bottomSheetHeight: 500, // Optional. Country list modal height
              //Optional. Sets the border radius for the bottomsheet.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              //Optional. Styles the search field.
              inputDecoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                  ),
                ),
              ),
            ),
            onSelect: (Country country) {
              setState(() {
                title=country.name;
              });
            },
          );
        },
        child:
        Padding(padding: EdgeInsets.only(top: 5,bottom: 5),child:  TextField(
            enabled: false,

            style: const TextStyle(color: Colors.grey),
            controller:title!=null? TextEditingController(text: title):null,

            decoration:  InputDecoration(


                label: Text(
                  'country'.tr(),
                  style: TextStyle(color: Colors.grey),
                ),
                suffixIcon: const Icon(
                  Icons.home_work_outlined,
                  color: secondaryColor,
                ),
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))

    ));
  }
}
