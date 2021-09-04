import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/model/cart.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'components/all_cart.dart';
import 'components/header.dart';

import 'components/cartlist.dart';

class Body extends StatelessWidget {
  final int KHACHHANG_ID;
  Body({
    Key? key,
    required this.KHACHHANG_ID,
  }) : super(key: key);

  RestApi restApi = RestApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllCart(restApi: restApi, KHACHHANG_ID: KHACHHANG_ID),
    );
  }
}
