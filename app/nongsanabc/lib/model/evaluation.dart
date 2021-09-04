import 'dart:convert';

class Evaluation {
  final String KHACHHANG_TEN;
  final String KHACHHANG_ANH_URL;
  final String DANHGIA_NOIDUNG;
  final String DANHGIA_SOSAO;

  Evaluation({
    required this.KHACHHANG_TEN,
    required this.KHACHHANG_ANH_URL,
    required this.DANHGIA_NOIDUNG,
    required this.DANHGIA_SOSAO,
  });

  Map<String, dynamic> toMap() {
    return {
      'KHACHHANG_TEN': KHACHHANG_TEN,
      'KHACHHANG_ANH_URL': KHACHHANG_ANH_URL,
      'DANHGIA_NOIDUNG': DANHGIA_NOIDUNG,
      'DANHGIA_SOSAO': DANHGIA_SOSAO,
    };
  }

  factory Evaluation.fromMap(Map<String, dynamic> map) {
    return Evaluation(
      KHACHHANG_TEN: map['KHACHHANG_TEN'],
      KHACHHANG_ANH_URL: map['KHACHHANG_ANH_URL'],
      DANHGIA_NOIDUNG: map['DANHGIA_NOIDUNG'],
      DANHGIA_SOSAO: map['DANHGIA_SOSAO'],
    );
  }
  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      KHACHHANG_TEN: json['KHACHHANG_TEN'],
      KHACHHANG_ANH_URL: json['KHACHHANG_ANH_URL'],
      DANHGIA_NOIDUNG: json['DANHGIA_NOIDUNG'],
      DANHGIA_SOSAO: json['DANHGIA_SOSAO'],
    );
  }
  String toJson() => json.encode(toMap());
}
