import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class FindProductScreen extends StatelessWidget {
  final String findWord;
  const FindProductScreen({Key? key, required this.findWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        findWord: findWord,
      ),
    );
  }
}
