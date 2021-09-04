import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:nongsanabc/model/bill.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';

import 'bill_list.dart';

class AllBill extends StatefulWidget {
  final int khachhang_id;

  const AllBill({
    Key? key,
    required this.khachhang_id,
  }) : super(key: key);
  @override
  _AllBillState createState() => _AllBillState();
}

class _AllBillState extends State<AllBill> {
  RestApi restApi = RestApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Bill>>(
        future: restApi.fetchBill(http.Client(), widget.khachhang_id),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? BillList(bills: snapshot.data!)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
