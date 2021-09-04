import 'dart:convert';

class BillDetailModel {
  final int SANPHAM_ID;
  final String SANPHAM_TEN;
  final int CHITIETDATHANG_SOLUONG;
  final int SANPHAM_DONGIA;
  final String SANPHAM_URL;
  BillDetailModel({
    required this.SANPHAM_ID,
    required this.SANPHAM_TEN,
    required this.CHITIETDATHANG_SOLUONG,
    required this.SANPHAM_DONGIA,
    required this.SANPHAM_URL,
  });

  Map<String, dynamic> toMap() {
    return {
      'SANPHAM_ID': SANPHAM_ID,
      'SANPHAM_TEN': SANPHAM_TEN,
      'CHITIETDATHANG_SOLUONG': CHITIETDATHANG_SOLUONG,
      'SANPHAM_DONGIA': SANPHAM_DONGIA,
      'SANPHAM_URL': SANPHAM_URL,
    };
  }

  factory BillDetailModel.fromMap(Map<String, dynamic> map) {
    return BillDetailModel(
      SANPHAM_ID: map['SANPHAM_ID'],
      SANPHAM_TEN: map['SANPHAM_TEN'],
      CHITIETDATHANG_SOLUONG: map['CHITIETDATHANG_SOLUONG'],
      SANPHAM_DONGIA: map['SANPHAM_DONGIA'],
      SANPHAM_URL: map['SANPHAM_URL'],
    );
  }

  String toJson() => json.encode(toMap());
  factory BillDetailModel.fromJson(Map<String, dynamic> json) {
    return BillDetailModel(
      SANPHAM_ID: json['SANPHAM_ID'],
      SANPHAM_TEN: json['SANPHAM_TEN'],
      CHITIETDATHANG_SOLUONG: json['CHITIETDATHANG_SOLUONG'],
      SANPHAM_DONGIA: json['SANPHAM_DONGIA'],
      SANPHAM_URL: json['SANPHAM_URL'],
    );
  }

  // factory BillDetail.fromJson(String source) => BillDetail.fromMap(json.decode(source));
}
