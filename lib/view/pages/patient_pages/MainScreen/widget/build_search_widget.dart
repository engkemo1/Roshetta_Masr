

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildSearchInput() => Container(
  decoration: BoxDecoration(
      color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
  child: Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 20),
    child: Row(
      children: [
        const Icon(
          Icons.search,
          size: 25,
          color: Colors.grey,
        ),
          Flexible (
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none,
              hintText: 'Search here'.tr()
            ),
          ),
        ),
      ],
    ),
  ),
);
