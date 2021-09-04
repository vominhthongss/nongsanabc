import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/processing.dart';
import 'product_detail_bill.dart';
import 'package:nongsanabc/model/bill_detail.dart';

class BillDetail extends StatefulWidget {
  final int DATHANG_ID;
  final String DATHANG_TRANGTHAI;

  BillDetail({
    Key? key,
    required this.DATHANG_ID,
    required this.DATHANG_TRANGTHAI,
  }) : super(key: key);

  @override
  _BillDetailState createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> {
  RestApi restApi = RestApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BillDetailModel>>(
        future: restApi.fetchDetailBill(http.Client(), widget.DATHANG_ID),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ProductBillList(
                  detaillists: snapshot.data!,
                  DATHANG_ID: widget.DATHANG_ID,
                  DATHANG_TRANGTHAI: widget.DATHANG_TRANGTHAI,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ProductBillList extends StatefulWidget {
  final List<BillDetailModel> detaillists;
  final int DATHANG_ID;
  final String DATHANG_TRANGTHAI;

  const ProductBillList(
      {Key? key,
      required this.detaillists,
      required this.DATHANG_ID,
      required this.DATHANG_TRANGTHAI})
      : super(key: key);

  @override
  _ProductBillListState createState() => _ProductBillListState();
}

class _ProductBillListState extends State<ProductBillList> {
  int tongTien() {
    int ketqua = 0;
    for (int i = 0; i < widget.detaillists.length; i++) {
      ketqua += (widget.detaillists[i].SANPHAM_DONGIA) *
          (widget.detaillists[i].CHITIETDATHANG_SOLUONG);
    }
    return ketqua;
  }

  Processing xuly = Processing();
  RestApi restApi = RestApi();
  void xoaDon(int dathangId) {
    Future<bool> response = restApi.deleteBill(dathangId);
    response.then(
      (value) => {
        if (value)
          {
            print("Xóa đơn thành công !"),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Nav(),
              ),
            ),
          }
        else
          {
            print("Không thành công !"),
          }
      },
    );
  }

  void huyDon(int dathangId) {
    Future<bool> response = restApi.cancelBill(dathangId);
    response.then(
      (value) => {
        if (value)
          {
            print("Hủy đơn thành công !"),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Nav(),
              ),
            ),
          }
        else
          {
            print("Không thành công !"),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.detaillists.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0
                  ? Column(
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
                                  //  color: Colors.white,
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
                                "CHI TIẾT ĐƠN HÀNG",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Text(""),
              ProductDetailBill(
                sanpham_id: widget.detaillists[index].SANPHAM_ID,
                sanpham_dongia: widget.detaillists[index].SANPHAM_DONGIA,
                sanpham_ten: widget.detaillists[index].SANPHAM_TEN,
                sanpham_url: widget.detaillists[index].SANPHAM_URL,
                chitietdathang_soluong:
                    widget.detaillists[index].CHITIETDATHANG_SOLUONG,
                DATHANG_TRANGTHAI: widget.DATHANG_TRANGTHAI,
                DATHANG_ID: widget.DATHANG_ID,
              ),
            ],
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
                    xuly.xulytien(tongTien()),
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          if (widget.DATHANG_TRANGTHAI == "Thành công")
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                onPressed: () {
                  xoaDon(widget.DATHANG_ID);
                },
                child: Text("Xóa đơn"),
              ),
            )
          else if (widget.DATHANG_TRANGTHAI == "Hủy")
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                onPressed: () {
                  xoaDon(widget.DATHANG_ID);
                },
                child: Text("Xóa đơn"),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                onPressed: () {
                  huyDon(widget.DATHANG_ID);
                },
                child: Text("Hủy đơn"),
              ),
            ),
        ],
      ),
    );
  }
}
