import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/screens/home/product_detail/product_detail_screen.dart';
import 'package:nongsanabc/screens/processing.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../test.dart';

class ProductCard extends StatefulWidget {
  final String SANPHAM_ID;
  final String LOAI_TEN;
  final String SANPHAM_TEN;
  final int SANPHAM_DONGIA;
  final String SANPHAM_MOTA;
  final String SANPHAM_SOLUONG;
  final String SANPHAM_URL;
  final String SANPHAM_SOSAO;
  const ProductCard({
    Key? key,
    required this.SANPHAM_ID,
    required this.LOAI_TEN,
    required this.SANPHAM_TEN,
    required this.SANPHAM_DONGIA,
    required this.SANPHAM_URL,
    required this.SANPHAM_SOSAO,
    required this.SANPHAM_MOTA,
    required this.SANPHAM_SOLUONG,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Processing xuly = Processing();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 140,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProducDetailScreen(
                  SANPHAM_ID: widget.SANPHAM_ID,
                  LOAI_TEN: widget.LOAI_TEN,
                  SANPHAM_TEN: widget.SANPHAM_TEN,
                  SANPHAM_DONGIA: widget.SANPHAM_DONGIA,
                  SANPHAM_MOTA: widget.SANPHAM_MOTA,
                  SANPHAM_URL: widget.SANPHAM_URL,
                  SANPHAM_SOSAO: widget.SANPHAM_SOSAO,
                  SANPHAM_SOLUONG: widget.SANPHAM_SOLUONG,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: Text(widget.SANPHAM_ID),
                    child: ImageFromApi(
                      URL: widget.SANPHAM_URL,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.yellow[800],
                  ),
                  Text(
                    xuly.xulysosao(widget.SANPHAM_SOSAO),
                    //style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  )
                ],
              ),
              // Text(
              //   SANPHAM_ID,
              //   style: TextStyle(color: Colors.black),
              //   maxLines: 2,
              // ),
              Text(
                widget.LOAI_TEN,
                style: TextStyle(color: Colors.yellow[800]),
                maxLines: 2,
              ),
              Text(
                widget.SANPHAM_TEN,
                style: TextStyle(color: Colors.green[800]),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    xuly.xulytien(widget.SANPHAM_DONGIA),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        // color: Colors.green[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// String xulytien(int sotien) {
//   String tien = sotien.toString();
//   int count = 0;
//   String ketqua = '';
//   for (int i = tien.length - 1; i >= 0; i--) {
//     count++;
//     ketqua += tien[i];
//     if (count == 3) {
//       ketqua += ',';
//       count = 0;
//     }
//   }

//   return ketqua.split('').reversed.join() + " đ";
// }

// String xulysosao(String sosao) {
//   String ketqua = '';
//   for (int i = 0; i < 3; i++) {
//     ketqua += sosao[i];
//   }

//   return ketqua;
// }
