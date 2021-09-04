import 'package:flutter/cupertino.dart';
import 'package:nongsanabc/model/bill.dart';
import 'package:nongsanabc/screens/delivery/body/components/info_delivery.dart';

import 'header.dart';

class BillList extends StatelessWidget {
  final List<Bill> bills;
  const BillList({
    Key? key,
    required this.bills,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bills.length == 0
        ? Center(child: Text("Bạn chưa có đơn hàng nào"))
        : ListView.builder(
            itemCount: bills.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  index == 0 ? Header() : Text(""),
                  InfoDelivery(
                    index: index,
                    DATHANG_ID: bills[index].DATHANG_ID,
                    DATHANG_TRANGTHAI: bills[index].DATHANG_TRANGTHAI,
                    DATHANG_NGAYDAT: bills[index].DATHANG_NGAYDAT,
                    KHACHHANG_TEN: bills[index].KHACHHANG_TEN,
                    KHACHHANG_SDT: bills[index].KHACHHANG_SDT,
                    DATHANG_NGAYGIAO: bills[index].DATHANG_NGAYGIAO,
                    KHACHHANG_DIACHI: bills[index].KHACHHANG_DIACHI,
                  )
                ],
              );
            },
          );
  }
}
