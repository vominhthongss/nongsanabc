import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/theme.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.SANPHAM_TEN,
    required this.SANPHAM_MOTA,
  }) : super(key: key);

  final String SANPHAM_TEN;
  final String SANPHAM_MOTA;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.only(top: 10),
      color: Colors.green[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              "Mô tả sản phẩm",
              style: MyTheme.heading1,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Tên sản phẩm: " + SANPHAM_TEN,
              style: MyTheme.normalFont,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 64,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.info,
                size: 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 64,
            ),
            child: Text(
              "Chi tiết: " + SANPHAM_MOTA,
              maxLines: 3,
              style: MyTheme.normalFont,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
