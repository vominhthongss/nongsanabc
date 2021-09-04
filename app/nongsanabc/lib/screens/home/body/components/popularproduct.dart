import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/model/product.dart';

import 'product_card.dart';

class PopularProducts extends StatefulWidget {
  final List<Product> ds;
  PopularProducts({
    Key? key,
    required this.ds,
  }) : super(key: key);

  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  int lengthCanSee = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "SẢN PHẨM PHỔ BIẾN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              lengthCanSee,
              (index) {
                return index != lengthCanSee - 1
                    ? ProductCard(
                        SANPHAM_ID: widget.ds[index].SANPHAM_ID.toString(),
                        LOAI_TEN: widget.ds[index].LOAI_TEN,
                        SANPHAM_TEN: widget.ds[index].SANPHAM_TEN,
                        SANPHAM_DONGIA: widget.ds[index].SANPHAM_DONGIA,
                        SANPHAM_SOSAO: widget.ds[index].TBSAO,
                        SANPHAM_URL: HOST_URL + widget.ds[index].SANPHAM_URL,
                        SANPHAM_MOTA: widget.ds[index].SANPHAM_MOTA,
                        SANPHAM_SOLUONG: widget.ds[index].SANPHAM_SOLUONG,
                      )
                    : Row(
                        children: [
                          ProductCard(
                            SANPHAM_ID: widget.ds[index].SANPHAM_ID.toString(),
                            LOAI_TEN: widget.ds[index].LOAI_TEN,
                            SANPHAM_TEN: widget.ds[index].SANPHAM_TEN,
                            SANPHAM_DONGIA: widget.ds[index].SANPHAM_DONGIA,
                            SANPHAM_SOSAO: widget.ds[index].TBSAO,
                            SANPHAM_URL:
                                HOST_URL + widget.ds[index].SANPHAM_URL,
                            SANPHAM_MOTA: widget.ds[index].SANPHAM_MOTA,
                            SANPHAM_SOLUONG: widget.ds[index].SANPHAM_SOLUONG,
                          ),
                          CupertinoButton(
                            child: Text("Xem thêm"),
                            onPressed: () {
                              setState(() {
                                print(index);
                                int temp = lengthCanSee + 3;
                                if (temp > widget.ds.length) {
                                  temp = widget.ds.length - lengthCanSee;
                                  lengthCanSee += temp;
                                } else {
                                  lengthCanSee = temp;
                                }
                                if (lengthCanSee == widget.ds.length) {
                                  print("Hết rồi!!! = " +
                                      lengthCanSee.toString());
                                }
                              });
                            },
                          ),
                        ],
                      );
              },
            ),
          ),
        )
      ],
    );
  }
}
