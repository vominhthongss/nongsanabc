import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/sign_in/sign_in.dart';

import 'components/all_bill.dart';
import 'components/header.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int khachhang_id = 0;
  Shpre shpre = Shpre();
  @override
  void initState() {
    Future<int> _khachhang_id = shpre.layId();
    _khachhang_id.then(
      (value) => {khachhang_id = value},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return khachhang_id == 0
        ? Center(
            child: SizedBox(
              width: 300,
              child: CupertinoButton.filled(
                child: Text("Đăng nhập để xem"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
              ),
            ),
            // ),
            // child: ElevatedButton(
            //   child: Text("Đăng nhập để xem"),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => SignInScreen()));
            //   },
            // ),
          )
        : AllBill(
            khachhang_id: khachhang_id,
          );
  }
}
