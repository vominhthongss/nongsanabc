import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/model/cart.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:http/http.dart' as http;

import 'cartlist.dart';

class AllCart extends StatelessWidget {
  const AllCart({
    Key? key,
    required this.restApi,
    required this.KHACHHANG_ID,
  }) : super(key: key);

  final RestApi restApi;
  final int KHACHHANG_ID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
      future: restApi.fetchAllCart(http.Client(), KHACHHANG_ID.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? CartList(
                carts: snapshot.data!,
                khachhang_id: KHACHHANG_ID,
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
