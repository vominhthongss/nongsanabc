import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class AllEvaluationScreen extends StatefulWidget {
  final int SANPHAM_ID;

  const AllEvaluationScreen({Key? key, required this.SANPHAM_ID})
      : super(key: key);
  @override
  _AllEvaluationScreenState createState() => _AllEvaluationScreenState();
}

class _AllEvaluationScreenState extends State<AllEvaluationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        SANPHAM_ID: widget.SANPHAM_ID,
      ),
    );
  }
}
