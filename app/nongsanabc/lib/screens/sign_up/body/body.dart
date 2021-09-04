import 'package:flutter/material.dart';
import 'components/sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  // color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "ĐĂNG KÝ",
                        style: TextStyle(
                          // color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hãy tham gia Nông Sản ABC để nhận ưu đãi cho riêng bạn !",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      SignUpForm(),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
