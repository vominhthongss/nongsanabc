import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body/body.dart';

class ProducDetailScreen extends StatelessWidget {
  final String SANPHAM_ID;
  final String LOAI_TEN;
  final String SANPHAM_TEN;
  final int SANPHAM_DONGIA;
  final String SANPHAM_URL;
  final String SANPHAM_SOLUONG;
  final String SANPHAM_SOSAO;
  final String SANPHAM_MOTA;
  ProducDetailScreen({
    Key? key,
    required this.SANPHAM_ID,
    required this.SANPHAM_TEN,
    required this.LOAI_TEN,
    required this.SANPHAM_DONGIA,
    required this.SANPHAM_URL,
    required this.SANPHAM_SOSAO,
    required this.SANPHAM_MOTA,
    required this.SANPHAM_SOLUONG,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        SANPHAM_ID: SANPHAM_ID,
        LOAI_TEN: LOAI_TEN,
        SANPHAM_TEN: SANPHAM_TEN,
        SANPHAM_DONGIA: SANPHAM_DONGIA,
        SANPHAM_URL: SANPHAM_URL,
        SANPHAM_SOSAO: SANPHAM_SOSAO,
        SANPHAM_MOTA: SANPHAM_MOTA,
        SANPHAM_SOLUONG: SANPHAM_SOLUONG,
      ),
    );
  }
}
