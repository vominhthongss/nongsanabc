import 'dart:convert';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/model/buying_detail.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/home/body/components/product_card.dart';
import 'package:nongsanabc/screens/processing.dart';
import 'package:nongsanabc/screens/sign_in/sign_in.dart';
import 'package:nongsanabc/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/description.dart';
import 'components/header.dart';

class Body extends StatefulWidget {
  final String SANPHAM_ID;
  final String LOAI_TEN;
  final String SANPHAM_TEN;
  final int SANPHAM_DONGIA;
  final String SANPHAM_URL;
  final String SANPHAM_SOLUONG;
  final String SANPHAM_SOSAO;
  final String SANPHAM_MOTA;
  Body({
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
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Processing xuly = Processing();
  int numberCounting = 1;
  // late Todo todos = Todo(
  //   SANPHAM_ID: widget.SANPHAM_ID,
  //   SANPHAM_SOLUONG: numberCounting.toString(),
  //   KHACHHANG_ID: "noname",
  // );
  //late List<Todo> danhsach = [todos];

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetBuy(
          SANPHAM_ID: widget.SANPHAM_ID,
          SANPHAM_TEN: widget.SANPHAM_TEN,
          SANPHAM_DONGIA: widget.SANPHAM_DONGIA,
          SOLUONGMUA: numberCounting.toString(),
        );
      },
    );
  }

  void _showModalBottomSheet2(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetBasket(
          SANPHAM_ID: widget.SANPHAM_ID,
          SANPHAM_TEN: widget.SANPHAM_TEN,
          SANPHAM_DONGIA: widget.SANPHAM_DONGIA,
          SOLUONGMUA: numberCounting.toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Header(
              xuly: xuly,
              SANPHAM_SOSAO: widget.SANPHAM_SOSAO,
              SANPHAM_ID: widget.SANPHAM_ID,
              SANPHAM_URL: widget.SANPHAM_URL,
              LOAI_TEN: widget.LOAI_TEN,
              SANPHAM_TEN: widget.SANPHAM_TEN,
              SANPHAM_MOTA: widget.SANPHAM_MOTA,
              SANPHAM_DONGIA: widget.SANPHAM_DONGIA,
            ),
          ),
          Text("S??? l?????ng c??n l???i: " + widget.SANPHAM_SOLUONG),
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton.filled(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        if (numberCounting > 1) {
                          numberCounting--;
                        }
                      });
                    },
                    child: Text("-"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    numberCounting.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  CupertinoButton.filled(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        numberCounting++;
                      });
                    },
                    child: Text("+"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton.filled(
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      _showModalBottomSheet2(context);
                    },
                    child: Text("Th??m v??o gi???"),
                  ),
                  SizedBox(width: 10),
                  CupertinoButton.filled(
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      _showModalBottomSheet(context);
                    },
                    child: Text("Mua ngay lu??n"),
                  ),
                ],
              ),
            ],
          ),
          Description(
            SANPHAM_TEN: widget.SANPHAM_TEN,
            SANPHAM_MOTA: widget.SANPHAM_MOTA,
          ),
        ],
      ),
    );
  }
}

class _BottomSheetBuy extends StatefulWidget {
  final String SANPHAM_ID;
  final String SANPHAM_TEN;
  final int SANPHAM_DONGIA;
  final String SOLUONGMUA;

  _BottomSheetBuy({
    Key? key,
    required this.SANPHAM_ID,
    required this.SANPHAM_TEN,
    required this.SANPHAM_DONGIA,
    required this.SOLUONGMUA,
  }) : super(key: key);

  @override
  __BottomSheetBuyState createState() => __BottomSheetBuyState();
}

class __BottomSheetBuyState extends State<_BottomSheetBuy> {
  RestApi restApi = RestApi();
  Processing xuly = Processing();
  void displayDialogMua() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Th??ng b??o"),
        content: new Text("B???n ch???c ch??? ? "),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              '????ng',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Mua',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Future<int> khachhang_id = shpre.layId();
              khachhang_id.then(
                (value) => {
                  if (value != 0)
                    {datHang(value)}
                  else
                    {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                    }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void datHang(int khachhang_id) {
    Detail monhang = Detail(
      SANPHAM_ID: int.parse(widget.SANPHAM_ID),
      CHITIETDATHANG_SOLUONG: int.parse(widget.SOLUONGMUA),
    );

    List<Detail> danhsachmua = [monhang];

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String toDay = formatter.format(now);

    Buying buying = Buying(
      // DATHANG_ID: 154264,
      TENDANGNHAP: ADMIN_NAME,
      KHACHHANG_ID: khachhang_id,
      DATHANG_TRANGTHAI: STATUS_BUYING,
      DATHANG_NGAYDAT: toDay,
      DATHANG_NGAYGIAO: "Ch??a r??",
      list: danhsachmua,
    );
    Future<bool> response = restApi.buyingGoods(buying);
    response.then(
      (value) => {
        if (value)
          {
            print("?????t th??nh c??ng !"),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Nav(),
              ),
            ),
          }
        else
          print("?????t kh??ng th??nh c??ng !")
      },
    );
  }

  Shpre shpre = Shpre();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "THANH TO??N",
                // GalleryLocalizations.of(context).demoBottomSheetHeader,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: Column(
              children: [
                // Text(SANPHAM_ID),
                Text(
                  widget.SANPHAM_TEN,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Th??nh ti???n: " +
                      xuly.xulytien(
                          widget.SANPHAM_DONGIA * int.parse(widget.SOLUONGMUA)),
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "S??? l?????ng mua: " + widget.SOLUONGMUA,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton.filled(
                  child: Text("Mua"),
                  onPressed: () {
                    displayDialogMua();
                  },
                ),

                // CupertinoButton.filled(
                //   onPressed: () async {
                //     if (await confirm(
                //       context,
                //       content: Text('B???n ch???c ch??? ?'),
                //       textOK: Text('Ch???c'),
                //       textCancel: Text('H???y'),
                //     )) {
                //       //?????t h??ng

                //       Future<int> khachhang_id = shpre.layId();
                //       khachhang_id.then(
                //         (value) => {
                //           if (value != 0)
                //             {datHang(value)}
                //           else
                //             {
                //               Navigator.pushReplacement(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => SignInScreen(),
                //                 ),
                //               ),
                //             }
                //         },
                //       );

                //       //?????t h??ng

                //     }
                //     return print('H???y');
                //   },
                //   child: Text("Mua"),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheetBasket extends StatefulWidget {
  final String SANPHAM_ID;
  final String SANPHAM_TEN;
  final int SANPHAM_DONGIA;
  final String SOLUONGMUA;
  _BottomSheetBasket({
    Key? key,
    required this.SANPHAM_ID,
    required this.SANPHAM_TEN,
    required this.SANPHAM_DONGIA,
    required this.SOLUONGMUA,
  }) : super(key: key);

  @override
  __BottomSheetBasketState createState() => __BottomSheetBasketState();
}

class __BottomSheetBasketState extends State<_BottomSheetBasket> {
  RestApi restApi = RestApi();
  void displayDialogThem() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Th??ng b??o"),
        content: new Text("B???n ch???c ch??? ? "),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              '????ng',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Th??m',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Future<int> khachhang_id = shpre.layId();
              khachhang_id.then(
                (value) => {
                  if (value != 0)
                    {
                      themGioHang(value),
                    }
                  else
                    {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                    }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void themGioHang(int khachhang_id) {
    Map<String, dynamic> thongtingio = {
      "KHACHHANG_ID": khachhang_id,
      "SANPHAM_ID": widget.SANPHAM_ID,
      "GIOHANG_SOLUONG": widget.SOLUONGMUA,
    };
    String gio = json.encode(thongtingio);

    Future<bool> response = restApi.addToCart(gio);
    response.then(
      (value) => {
        if (value)
          {
            print("Th??nh c??ng !"),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Nav(),
              ),
            ),
          }
        else
          print("Kh??ng th??nh c??ng !")
      },
    );
  }

  Shpre shpre = Shpre();
  Processing xuly = Processing();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "TH??M V??O GI??? H??NG",
                // GalleryLocalizations.of(context).demoBottomSheetHeader,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: Column(
              children: [
                // Text(SANPHAM_ID),
                Text(
                  widget.SANPHAM_TEN,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Th??nh ti???n: " +
                      xuly.xulytien(
                          widget.SANPHAM_DONGIA * int.parse(widget.SOLUONGMUA)),
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "S??? l?????ng th??m: " + widget.SOLUONGMUA,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton.filled(
                  child: Text("Th??m"),
                  onPressed: () {
                    displayDialogThem();
                  },
                )

                // CupertinoButton.filled(
                //   onPressed: () async {
                //     if (await confirm(
                //       context,
                //       content: Text('B???n ch???c ch??? ?'),
                //       textOK: Text('Ch???c'),
                //       textCancel: Text('H???y'),
                //     )) {
                //       Future<int> khachhang_id = shpre.layId();
                //       khachhang_id.then((value) => {
                //             if (value != 0)
                //               {
                //                 themGioHang(value),
                //               }
                //             else
                //               {
                //                 Navigator.pushReplacement(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) => SignInScreen(),
                //                   ),
                //                 ),
                //               }
                //           });
                //     }
                //     return print('H???y');
                //   },
                //   child: Text("Th??m"),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
