import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body/body.dart';

class CartScreen extends StatelessWidget {
  final int KHACHHANG_ID;
  CartScreen({Key? key, required this.KHACHHANG_ID}) : super(key: key);

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        KHACHHANG_ID: KHACHHANG_ID,
      ),
    );
  }
}
