import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/model/cart.dart';
import 'package:nongsanabc/model/buying_detail.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/screens/cart/cart_screen.dart';
import 'package:nongsanabc/screens/home/body/components/product_card.dart';
import 'package:nongsanabc/screens/processing.dart';

import 'header.dart';

class CartList extends StatefulWidget {
  final List<Cart> carts;
  final int khachhang_id;

  CartList({Key? key, required this.carts, required this.khachhang_id})
      : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  RestApi restApi = RestApi();
  List<Detail> danhsachmua = [];

  List<bool> checkList = [];
  List<int> soLuong = [];
  int tongTien = 0;
  @override
  void initState() {
    for (int i = 0; i < widget.carts.length; i++) {
      checkList.add(true);
      soLuong.add(widget.carts[i].GIOHANG_SOLUONG);
    }
    capNhatTong();
    super.initState();
  }

  void capNhatTong() {
    tongTien = 0;
    for (int i = 0; i < widget.carts.length; i++) {
      if (checkList[i] == true) {
        tongTien += soLuong[i] * widget.carts[i].SANPHAM_DONGIA;
      }
    }
  }

  void xoaGioHang(int khachhang_id, int sanpham_id) {
    Future<bool> response = restApi.delteCart(khachhang_id, sanpham_id);
    response.then(
      (value) => {
        if (value)
          {print("Xóa thành công !")}
        else
          print("Xóa không thành công !"),
      },
    );
  }

  void themGioHang(int khachhang_id, int sanpham_id, int giohang_soluong) {
    Map<String, dynamic> thongtingio = {
      "KHACHHANG_ID": khachhang_id,
      "SANPHAM_ID": sanpham_id,
      "GIOHANG_SOLUONG": giohang_soluong,
    };
    String gio = json.encode(thongtingio);
    restApi.addToCart(gio);
  }

  void mua() {
    int count = 0;
    danhsachmua = [];
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String toDay = formatter.format(now);
    for (int i = 0; i < widget.carts.length; i++) {
      if (checkList[i] == true) {
        count++;
        danhsachmua.add(
          Detail(
              SANPHAM_ID: widget.carts[i].SANPHAM_ID,
              CHITIETDATHANG_SOLUONG: widget.carts[i].GIOHANG_SOLUONG),
        );
      }
    }
    if (count > 0) {
      Buying buying = Buying(
        TENDANGNHAP: ADMIN_NAME,
        KHACHHANG_ID: widget.khachhang_id,
        DATHANG_TRANGTHAI: STATUS_BUYING,
        DATHANG_NGAYDAT: toDay,
        DATHANG_NGAYGIAO: "Chưa rõ",
        list: danhsachmua,
      );
      restApi.buyingGoods(buying);
      print("Mua thành công " + buying.toJson());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Nav(),
        ),
      );
    } else
      print("Không đủ sản phẩm đặt");
  }

  Processing xuly = Processing();

  @override
  Widget build(BuildContext context) {
    return widget.carts.length == 0
        ? Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Header(),
              SizedBox(
                height: 300,
              ),
              Text("Không có sản phẩm nào được bạn thêm"),
            ],
          )
        : Scaffold(
            body: ListView.builder(
              itemCount: widget.carts.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Center(child: index == 0 ? Header() : null),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        // ignore: deprecated_member_use
                        child: Container(
                          padding: EdgeInsets.all(20),
                          // color: Color(0xFFF5F6F9),
                          //chi tiet
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: checkList[index],
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      checkList[index] = value!;
                                      capNhatTong();
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 50,
                                child: ImageFromApi(
                                    URL: HOST_URL +
                                        widget.carts[index].SANPHAM_URL
                                            .toString()),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(widget.carts[index].SANPHAM_TEN),
                              ),
                              SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "    " +
                                              xuly.xulytien(widget.carts[index]
                                                      .SANPHAM_DONGIA *
                                                  soLuong[index]),
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: 35,
                                          height: 25,
                                          child: CupertinoButton.filled(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              if (soLuong[index] > 1) {
                                                setState(() {
                                                  soLuong[index]--;
                                                  themGioHang(
                                                    widget.khachhang_id,
                                                    widget.carts[index]
                                                        .SANPHAM_ID,
                                                    -1,
                                                  );
                                                  capNhatTong();
                                                });
                                              }
                                            },
                                            child: Text("-"),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(soLuong[index].toString()),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          width: 35,
                                          height: 25,
                                          child: CupertinoButton.filled(
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              setState(() {
                                                soLuong[index]++;
                                                themGioHang(
                                                  widget.khachhang_id,
                                                  widget
                                                      .carts[index].SANPHAM_ID,
                                                  1,
                                                );
                                                capNhatTong();
                                              });
                                            },
                                            child: Text("+"),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: IconButton(
                                  tooltip: "Xóa",
                                  onPressed: () {
                                    setState(
                                      () {
                                        xoaGioHang(widget.khachhang_id,
                                            widget.carts[index].SANPHAM_ID);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CartScreen(
                                                KHACHHANG_ID:
                                                    widget.khachhang_id),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Center(
                      //     child: index == widget.carts.length - 1
                      //         ? Column(
                      //             children: [
                      //               SizedBox(
                      //                 height: 20,
                      //               ),
                      //               Container(
                      //                 color: Colors.red[100],
                      //                 padding: EdgeInsets.all(10),
                      //                 child: Text(
                      //                   "Số tiền thanh toán:",
                      //                   style: TextStyle(
                      //                       fontSize: 30, color: Colors.blue),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 20,
                      //               ),
                      //               Container(
                      //                 color: Colors.blue[100],
                      //                 padding: EdgeInsets.all(20),
                      //                 child: Text(
                      //                   xuly.xulytien(tongTien),
                      //                   style: TextStyle(
                      //                       fontSize: 25, color: Colors.red),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 20,
                      //               ),
                      //               SizedBox(
                      //                 child: CupertinoButton.filled(
                      //                   onPressed: mua,
                      //                   child: Text("Mua"),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //             ],
                      //           )
                      //         : null)
                    ],
                  ),
                );
              },
            ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        Text("Tổng: "),
                        Text(
                          xuly.xulytien(tongTien),
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                    onPressed: mua,
                    child: Text("Mua"),
                  ),
                ),
              ],
            ),
          );
  }
}
