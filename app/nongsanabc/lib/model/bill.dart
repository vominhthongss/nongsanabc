import 'dart:convert';

class Bill {
  final int DATHANG_ID;
  final String KHACHHANG_TEN;
  final int KHACHHANG_SDT;
  final String DATHANG_TRANGTHAI;
  final String DATHANG_NGAYDAT;
  final String DATHANG_NGAYGIAO;
  final String KHACHHANG_DIACHI;

  Bill({
    required this.DATHANG_ID,
    required this.KHACHHANG_TEN,
    required this.KHACHHANG_SDT,
    required this.DATHANG_TRANGTHAI,
    required this.DATHANG_NGAYDAT,
    required this.DATHANG_NGAYGIAO,
    required this.KHACHHANG_DIACHI,
  });

  Map<String, dynamic> toMap() {
    return {
      'DATHANG_ID': DATHANG_ID,
      'KHACHHANG_TEN': KHACHHANG_TEN,
      'KHACHHANG_SDT': KHACHHANG_SDT,
      'DATHANG_TRANGTHAI': DATHANG_TRANGTHAI,
      'DATHANG_NGAYDAT': DATHANG_NGAYDAT,
      'DATHANG_NGAYGIAO': DATHANG_NGAYGIAO,
      'KHACHHANG_DIACHI': KHACHHANG_DIACHI,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      DATHANG_ID: map['DATHANG_ID'],
      KHACHHANG_TEN: map['KHACHHANG_TEN'],
      KHACHHANG_SDT: map['KHACHHANG_SDT'],
      DATHANG_TRANGTHAI: map['DATHANG_TRANGTHAI'],
      DATHANG_NGAYDAT: map['DATHANG_NGAYDAT'],
      DATHANG_NGAYGIAO: map['DATHANG_NGAYGIAO'],
      KHACHHANG_DIACHI: map['KHACHHANG_DIACHI'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      DATHANG_ID: json['DATHANG_ID'],
      KHACHHANG_TEN: json['KHACHHANG_TEN'],
      KHACHHANG_SDT: json['KHACHHANG_SDT'],
      DATHANG_TRANGTHAI: json['DATHANG_TRANGTHAI'],
      DATHANG_NGAYDAT: json['DATHANG_NGAYDAT'],
      DATHANG_NGAYGIAO: json['DATHANG_NGAYGIAO'],
      KHACHHANG_DIACHI: json['KHACHHANG_DIACHI'],
    );
  }

  // factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source));
}
