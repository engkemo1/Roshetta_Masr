
import 'package:flutter/material.dart';
import 'package:roshetta_masr/view/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Cart Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:           Text( 'No item in cart')
            ,)
        ],
      ),
    );
  }
}
