import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/all_product.dart';
import 'components/categories.dart';
import 'components/header.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Header(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 20),
            AllProduct(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
