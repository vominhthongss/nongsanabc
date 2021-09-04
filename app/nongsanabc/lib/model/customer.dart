import 'dart:convert';

class Customer {
  final String KHACHHANG_TEN;
  final int KHACHHANG_SDT;
  final String KHACHHANG_PHAI;
  final String KHACHHANG_DIACHI;
  final String KHACHHANG_NGAYSINH;
  final String KHACHHANG_MATKHAU;
  final String KHACHHANG_ANH_URL;

  Customer({
    required this.KHACHHANG_TEN,
    required this.KHACHHANG_SDT,
    required this.KHACHHANG_PHAI,
    required this.KHACHHANG_DIACHI,
    required this.KHACHHANG_NGAYSINH,
    required this.KHACHHANG_MATKHAU,
    required this.KHACHHANG_ANH_URL,
  });

  Map<String, dynamic> toMap() {
    return {
      'KHACHHANG_TEN': KHACHHANG_TEN,
      'KHACHHANG_SDT': KHACHHANG_SDT,
      'KHACHHANG_PHAI': KHACHHANG_PHAI,
      'KHACHHANG_DIACHI': KHACHHANG_DIACHI,
      'KHACHHANG_NGAYSINH': KHACHHANG_NGAYSINH,
      'KHACHHANG_MATKHAU': KHACHHANG_MATKHAU,
      'KHACHHANG_ANH_URL': KHACHHANG_ANH_URL,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      KHACHHANG_TEN: map['KHACHHANG_TEN'],
      KHACHHANG_SDT: map['KHACHHANG_SDT'],
      KHACHHANG_PHAI: map['KHACHHANG_PHAI'],
      KHACHHANG_DIACHI: map['KHACHHANG_DIACHI'],
      KHACHHANG_NGAYSINH: map['KHACHHANG_NGAYSINH'],
      KHACHHANG_MATKHAU: map['KHACHHANG_MATKHAU'],
      KHACHHANG_ANH_URL: map['KHACHHANG_ANH_URL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));
}
