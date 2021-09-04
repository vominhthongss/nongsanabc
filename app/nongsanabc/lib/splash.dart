import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:nongsanabc/nav.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        // 5 seconds over, navigate to Page2.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Nav(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/hinh.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
