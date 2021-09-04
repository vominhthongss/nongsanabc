import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                // ignore: deprecated_member_use
                child: FlatButton(
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
              ),
              SizedBox(
                width: 45,
              ),
              Text(
                "GIỎ HÀNG CỦA BẠN",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
