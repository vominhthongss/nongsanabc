import 'dart:convert';

class Detail {
  final int SANPHAM_ID;
  final int CHITIETDATHANG_SOLUONG;

  Detail({
    required this.SANPHAM_ID,
    required this.CHITIETDATHANG_SOLUONG,
  });

  Map<String, dynamic> toMap() {
    return {
      'SANPHAM_ID': SANPHAM_ID,
      'CHITIETDATHANG_SOLUONG': CHITIETDATHANG_SOLUONG,
    };
  }

  String toJson() => json.encode(toMap());
}

class Buying {
  // final int DATHANG_ID;
  final String TENDANGNHAP;
  final int KHACHHANG_ID;
  final String DATHANG_TRANGTHAI;
  final String DATHANG_NGAYDAT;
  final String DATHANG_NGAYGIAO;
  final List<Detail> list;

  Buying({
    // required this.DATHANG_ID,
    required this.KHACHHANG_ID,
    required this.TENDANGNHAP,
    required this.DATHANG_TRANGTHAI,
    required this.DATHANG_NGAYDAT,
    required this.DATHANG_NGAYGIAO,
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'DATHANG_ID': DATHANG_ID,
      'TENDANGNHAP': TENDANGNHAP,
      'KHACHHANG_ID': KHACHHANG_ID,
      'DATHANG_TRANGTHAI': DATHANG_TRANGTHAI,
      'DATHANG_NGAYDAT': DATHANG_NGAYDAT,
      'DATHANG_NGAYGIAO': DATHANG_NGAYGIAO,
      'list': list,
    };
  }

  String toJson() {
    String result = json.encode(toMap());
    result = result.replaceAll("\\", "");
    result = result.replaceAll("[\"", "[");
    result = result.replaceAll("\"]", "]");
    result = result.replaceAll("}\",\"{", "},{");
    return result;
  }
}

// void main() {
//   Detail ds1 = Detail(SANPHAM_ID: "12123", SANPHAM_TEN: "1312312");
//   Detail ds2 = Detail(SANPHAM_ID: "4343", SANPHAM_TEN: "96612");
//   List<Detail> danhsach = [ds1];
//   danhsach.add(ds2);

//   String danhsachJson = jsonEncode(danhsach);

//   Buying mua =
//       Buying(DATHANG_ID: "123", KHACHHANG_ID: "1231231", list: danhsach);

//   print(danhsachJson);
//   print(mua.toJson());
// }
