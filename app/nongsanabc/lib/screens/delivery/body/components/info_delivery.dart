import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/screens/delivery/body/components/bill_detail.dart';
import 'package:nongsanabc/theme.dart';

class InfoDelivery extends StatelessWidget {
  final int index;
  final int DATHANG_ID;
  final String KHACHHANG_TEN;
  final int KHACHHANG_SDT;
  final String DATHANG_TRANGTHAI;
  final String DATHANG_NGAYDAT;
  final String DATHANG_NGAYGIAO;
  final String KHACHHANG_DIACHI;

  InfoDelivery({
    Key? key,
    required this.index,
    required this.DATHANG_ID,
    required this.DATHANG_TRANGTHAI,
    required this.DATHANG_NGAYDAT,
    required this.KHACHHANG_TEN,
    required this.KHACHHANG_SDT,
    required this.DATHANG_NGAYGIAO,
    required this.KHACHHANG_DIACHI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.all(20),
        height: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

        // color: MyTheme.colorButton,
        // color: Colors.green[50],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BillDetail(
                DATHANG_ID: DATHANG_ID,
                DATHANG_TRANGTHAI: DATHANG_TRANGTHAI,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Text(
              (index + 1).toString() + "/",
              style: MyTheme.normalFont,
            ),
            Icon(
              Icons.delivery_dining,
              //           color: Colors.black,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Mã đơn hàng: " + DATHANG_ID.toString(),
                    style: MyTheme.normalFont,
                  ),
                  //    Text("Tên khách hàng: " + KHACHHANG_TEN),
                  Text(
                    "Số điện thoai: " + KHACHHANG_SDT.toString(),
                    style: MyTheme.normalFont,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trạng thái: ",
                        style: MyTheme.normalFont,
                      ),
                      if (DATHANG_TRANGTHAI == "Đang giao")
                        Text(
                          DATHANG_TRANGTHAI,
                          style: TextStyle(color: Colors.blue),
                        )
                      else if (DATHANG_TRANGTHAI == "Hủy")
                        Text(
                          DATHANG_TRANGTHAI,
                          style: TextStyle(color: Colors.red),
                        )
                      else if (DATHANG_TRANGTHAI == "Thành công")
                        Text(
                          DATHANG_TRANGTHAI,
                          style: TextStyle(color: Colors.green),
                        )
                      else if (DATHANG_TRANGTHAI == "Chờ duyệt")
                        Text(
                          DATHANG_TRANGTHAI,
                          style: TextStyle(color: Colors.pink),
                        )
                    ],
                  ),
                  Text(
                    "Ngày đặt: " + DATHANG_NGAYDAT,
                    style: MyTheme.normalFont,
                  ),
                  Text(
                    "Địa chỉ của bạn: " + KHACHHANG_DIACHI,
                    style: MyTheme.normalFont,
                  ),
                ],
              ),
            ),
            if (DATHANG_TRANGTHAI == "Đang giao")
              Icon(
                Icons.info,
                color: Colors.yellow[800],
              )
            else if (DATHANG_TRANGTHAI == "Hủy")
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            else if (DATHANG_TRANGTHAI == "Thành công")
              Icon(
                Icons.check,
                color: Colors.green,
              )
            else if (DATHANG_TRANGTHAI == "Chờ duyệt")
              Icon(
                Icons.timelapse,
                color: Colors.pink,
              ),
          ],
        ),
      ),
    );
  }
}
