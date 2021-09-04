import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/model/bill.dart';
import 'package:nongsanabc/model/bill_detail.dart';
import 'package:nongsanabc/model/buying_detail.dart';
import 'package:nongsanabc/model/cart.dart';
import 'package:nongsanabc/model/customer.dart';
import 'package:nongsanabc/model/evaluation.dart';
import 'package:nongsanabc/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RestApi {
  //Lấy toàn bộ sản phẩm
  Future<List<Product>> fetchAllProduct(http.Client client) async {
    final response = await client.get(Uri.parse(ALL_PRODUCT_API_URL));
    return parseData(response.body);

    // return compute(parseData, response.body);
  }

  //Lấy loại
  Future<List<Product>> fetchProductType(
      http.Client client, String loaiTen) async {
    final response =
        await client.get(Uri.parse(TYPE_PRODUCT_API_URL + loaiTen));
    return parseData(response.body);
  }

  //List để chứa sản phẩm
  List<Product> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  //Tìm sản phẩm
  Future<List<Product>> fetchFindProduct(
      http.Client client, String sanpham_ten) async {
    final response = await client.get(Uri.parse(FIND_PRODUCT + sanpham_ten));
    return parseData(response.body);
  }

  //Đặt hàng

  Future<bool> buyingGoods(Buying buying) async {
    final response = await http.post(Uri.parse(BUY_GOODS),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: buying.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //Thêm vào giỏ hàng 1 sản phẩm
  Future<bool> addToCart(String cart) async {
    final response = await http.post(
      Uri.parse(ADD_TO_CART),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: cart,
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> delteCart(int khachhang_id, int sanpham_id) async {
    final response = await http.get(Uri.parse(
        DELETE_CART + khachhang_id.toString() + '/' + sanpham_id.toString()));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //Lấy toàn bộ giỏ hàng
  Future<List<Cart>> fetchAllCart(
      http.Client client, String khachhang_id) async {
    final response = await client.get(Uri.parse(CHECK_CART + khachhang_id));
    return parseData2(response.body);
  }

  //List để chứa giỏ hàng
  List<Cart> parseData2(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
  }

  //Đăng ký
  Future<bool> signUp(Customer customer) async {
    final response = await http.post(
      Uri.parse(SIGNUP),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: customer.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //Đăng nhập
  Future<http.Response> login(
      int khachhang_sdt, String khachhang_matkhau) async {
    final response = await http.post(
        Uri.parse(LOGIN + khachhang_sdt.toString() + "/" + khachhang_matkhau));
    if (response.statusCode == 201) {
      return response;
    } else {
      return response;
    }
  }

  //Lấy toàn bộ đơn hàng
  Future<List<Bill>> fetchBill(http.Client client, int khachhang_id) async {
    final response =
        await client.get(Uri.parse(ALL_BILL + khachhang_id.toString()));
    return parseBill(response.body);
  }

  //List để chứa đơn hàng
  List<Bill> parseBill(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Bill>((json) => Bill.fromJson(json)).toList();
  }

  Future<List<BillDetailModel>> fetchDetailBill(
      http.Client client, int dathang_id) async {
    final response =
        await client.get(Uri.parse(DETAIL_BILL + dathang_id.toString()));
    return parseDetail(response.body);
  }

  //List để chứa sản phẩm
  List<BillDetailModel> parseDetail(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<BillDetailModel>((json) => BillDetailModel.fromJson(json))
        .toList();
  }

  Future<bool> deleteBill(int dathang_id) async {
    final response =
        await http.post(Uri.parse(DELETE_BILL + dathang_id.toString()));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cancelBill(int dathang_id) async {
    final response =
        await http.post(Uri.parse(CANCEL_BILL + dathang_id.toString()));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkEvaluation(int sanpham_id, int khachhang_id) async {
    final response = await http.get(Uri.parse(
        CHECK_EVA + sanpham_id.toString() + '/' + khachhang_id.toString()));

    if (response.statusCode == 200) {
      if (response.body == "1") {
        return true;
      } else
        return false;
    } else
      return false;
  }

  Future<bool> submitEvaluation(int khachhang_id, int sanpham_id,
      String danhgia_noidung, String danhgia_sosao) async {
    final response = await http.post(
      Uri.parse(SUBMIT_EVALUATION),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'KHACHHANG_ID': khachhang_id,
        'SANPHAM_ID': sanpham_id,
        'DANHGIA_NOIDUNG': danhgia_noidung,
        'DANHGIA_SOSAO': danhgia_sosao,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  //Lấy toàn bộ đánh giá
  Future<List<Evaluation>> fetchEvaluation(
      http.Client client, int sanpham_id) async {
    final response =
        await client.get(Uri.parse(GET_ALL_EVALUATION + sanpham_id.toString()));
    return parseEvaluation(response.body);
  }

  //List để chứa đánh giá
  List<Evaluation> parseEvaluation(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Evaluation>((json) => Evaluation.fromJson(json)).toList();
  }

  Future<bool> updateInfo(
      int khachhang_id,
      String khachhang_ten,
      String khachhang_phai,
      String khachhang_diachi,
      String khachhang_ngaysinh) async {
    final response = await http.post(
      Uri.parse(UPDATE_INFO),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'KHACHHANG_ID': khachhang_id,
        'KHACHHANG_TEN': khachhang_ten,
        'KHACHHANG_PHAI': khachhang_phai,
        'KHACHHANG_DIACHI': khachhang_diachi,
        'KHACHHANG_NGAYSINH': khachhang_ngaysinh,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else
      return false;
  }

  Future<bool> changePassword(
      int khachhang_id, String khachhang_matkhau) async {
    final response = await http.post(
      Uri.parse(CHANGE_PASSWORD),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'KHACHHANG_ID': khachhang_id,
        'KHACHHANG_MATKHAU': khachhang_matkhau,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else
      return false;
  }

  //Upload avatar
  Future<String> getImage(context, int id) async {
    String ketqua = '';
    // ignore: deprecated_member_use
    var image = await ImagePicker().getImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500.0,
        maxWidth: 500.0);
    if (image != null) {
      var imageFile = File(image.path);
      //_uploadFile(imageFile, id);

      String name = imageFile.path.split('/').last;
      var data = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imageFile.path,
          filename: name,
        ),
        "khachhang_id": id,
      });

      Dio dio = new Dio();
      await dio
          .post(POST_AVA, data: data)
          .then(
            (response) => {
              ketqua = response.toString(),
              print("lan1 " + ketqua),
            },
          )
          .catchError((error) => print("Dio error=" + error.toString()));
    }
    print("lan2 " + ketqua);
    return ketqua;
  }

  _uploadFile(File file, int id) async {
    String name = file.path.split('/').last;
    var data = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: name,
      ),
      "khachhang_id": id,
    });

    Dio dio = new Dio();
    await dio
        .post(POST_AVA, data: data)
        .then(
          (response) => print("Kết quả :=" + response.toString()),
        )
        .catchError((error) => print("Dio error=" + error.toString()));
  }

  //Lay avt
  // Future<String> getAvatar(int khachhang_id) async {
  //   final response =
  //       await http.get(Uri.parse(GET_AVT + khachhang_id.toString()));
  //   List<dynamic> body = [];
  //   body = jsonDecode(response.body);
  //   return body[0]["KHACHHANG_ANH_URL"];
  // }
}
