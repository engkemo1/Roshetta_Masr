import 'package:flutter/material.dart';

networkImageCustom(
    {String? url,
    double? width = double.infinity,
    double? height = 30,
    BoxFit fit = BoxFit.cover,
    double? borderRadius = 8,}) {
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius!),
    ),
    child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading.png', image: url!, fit: fit),
  );
}
