import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/delivery/body/components/evaluation/evaluation.dart';
import 'package:nongsanabc/screens/processing.dart';
import 'package:nongsanabc/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetailBill extends StatefulWidget {
  final String DATHANG_TRANGTHAI;
  final int DATHANG_ID;
  final int sanpham_id;
  final String sanpham_url;
  final String sanpham_ten;
  final int sanpham_dongia;
  final int chitietdathang_soluong;
  ProductDetailBill({
    Key? key,
    required this.sanpham_url,
    required this.sanpham_ten,
    required this.sanpham_dongia,
    required this.chitietdathang_soluong,
    required this.sanpham_id,
    required this.DATHANG_TRANGTHAI,
    required this.DATHANG_ID,
  }) : super(key: key);

  @override
  _ProductDetailBillState createState() => _ProductDetailBillState();
}

class _ProductDetailBillState extends State<ProductDetailBill> {
  Processing xuly = Processing();
  RestApi restApi = RestApi();
  Shpre shpre = Shpre();
  late Future<bool> _check;

  late String action;
  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content: new Text(
            "Bạn đã đánh giá sản phẩm này, bạn có muốn đánh giá lại ?"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Đóng',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text(
              'Tiếp tục',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EvaluationScreen(
                    DATHANG_TRANGTHAI: widget.DATHANG_TRANGTHAI,
                    DATHANG_ID: widget.DATHANG_ID,
                    sanpham_id: widget.sanpham_id,
                    sanpham_url: widget.sanpham_url,
                    sanpham_ten: widget.sanpham_ten,
                    sanpham_dongia: widget.sanpham_dongia,
                    chitietdathang_soluong: widget.chitietdathang_soluong,
                    action: action,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void danhGia() {
    Future<int> _id = shpre.layId();
    _id.then(
      (khachhang_id) => ({
        print("Id= " + khachhang_id.toString()),
        print("Đánh giá sản phẩm= " + widget.sanpham_id.toString()),
        _check = restApi.checkEvaluation(widget.sanpham_id, khachhang_id),
        _check.then((kt) => {
              if (kt == true)
                {
                  action = "Chỉnh sửa",
                  displayDialog(),
                }
              else
                {
                  action = "Đánh giá",
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EvaluationScreen(
                          DATHANG_TRANGTHAI: widget.DATHANG_TRANGTHAI,
                          DATHANG_ID: widget.DATHANG_ID,
                          sanpham_id: widget.sanpham_id,
                          sanpham_url: widget.sanpham_url,
                          sanpham_ten: widget.sanpham_ten,
                          sanpham_dongia: widget.sanpham_dongia,
                          chitietdathang_soluong: widget.chitietdathang_soluong,
                          action: action),
                    ),
                  ),
                }
            }),
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          // color: Color(0xFFF5F6F9),
          //chi tiet
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: ImageFromApi(URL: HOST_URL + widget.sanpham_url),
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 80,
                child: Text(widget.sanpham_ten),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  xuly.xulytien(widget.sanpham_dongia),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text("x" + widget.chitietdathang_soluong.toString()),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  " = " +
                      xuly.xulytien(widget.chitietdathang_soluong *
                          widget.sanpham_dongia),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        widget.DATHANG_TRANGTHAI == "Thành công" // kiểm tra Thành công chưa
            ? Column(
                children: [
                  CupertinoButton.filled(
                    child: Text("Đánh giá"),
                    onPressed: () {
                      danhGia();
                    },
                  ),
                ],
              )
            : Text(""),
      ],
    );
  }
}
