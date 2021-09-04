class Product {
  final int SANPHAM_ID;
  final String LOAI_TEN;
  final String SANPHAM_TEN;
  final String SANPHAM_MOTA;
  final String SANPHAM_URL;
  final String SANPHAM_SOLUONG;
  final int SANPHAM_DONGIA;
  final String TBSAO;

  Product({
    required this.SANPHAM_ID,
    required this.LOAI_TEN,
    required this.SANPHAM_TEN,
    required this.SANPHAM_MOTA,
    required this.SANPHAM_URL,
    required this.SANPHAM_SOLUONG,
    required this.SANPHAM_DONGIA,
    required this.TBSAO,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      SANPHAM_ID: json['SANPHAM_ID'] as int,
      LOAI_TEN: json['LOAI_TEN'] as String,
      SANPHAM_TEN: json['SANPHAM_TEN'] as String,
      SANPHAM_MOTA: json['SANPHAM_MOTA'] as String,
      SANPHAM_URL: json['SANPHAM_URL'] as String,
      SANPHAM_SOLUONG: json['SANPHAM_SOLUONG'] as String,
      SANPHAM_DONGIA: json['SANPHAM_DONGIA'] as int,
      TBSAO: json['TBSAO'] as String,
    );
  }
}
