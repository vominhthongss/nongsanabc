import 'dart:convert';

class Cart {
  final int SANPHAM_ID;
  final String SANPHAM_TEN;
  final int GIOHANG_SOLUONG;
  final int SANPHAM_DONGIA;
  final String SANPHAM_URL;
  Cart({
    required this.SANPHAM_ID,
    required this.SANPHAM_TEN,
    required this.GIOHANG_SOLUONG,
    required this.SANPHAM_DONGIA,
    required this.SANPHAM_URL,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'SANPHAM_ID': SANPHAM_ID,
  //     'SANPHAM_TEN': SANPHAM_TEN,
  //     'CHITIETDATHANG_SOLUONG': CHITIETDATHANG_SOLUONG,
  //     'SANPHAM_DONGIA': SANPHAM_DONGIA,
  //     'SANPHAM_URL': SANPHAM_URL,
  //   };
  // }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      SANPHAM_ID: json['SANPHAM_ID'] as int,
      SANPHAM_TEN: json['SANPHAM_TEN'] as String,
      GIOHANG_SOLUONG: json['GIOHANG_SOLUONG'] as int,
      SANPHAM_DONGIA: json['SANPHAM_DONGIA'] as int,
      SANPHAM_URL: json['SANPHAM_URL'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}
