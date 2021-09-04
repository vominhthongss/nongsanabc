import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:nongsanabc/model/customer.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';

import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/account/account_screen.dart';
import 'package:nongsanabc/secure/secure.dart';
import 'package:nongsanabc/theme.dart';

// ignore: use_key_in_widget_constructors
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _khachhang_ten = TextEditingController();

  final TextEditingController _khachhang_sdt = TextEditingController();
  // final TextEditingController _khachhang_phai = TextEditingController();
  late String _khachhang_phai = "Nam";
  final TextEditingController _khachhang_diachi = TextEditingController();
  final TextEditingController _khachhang_ngaysinh = TextEditingController();
  final TextEditingController _khachhang_matkhau = TextEditingController();
  final TextEditingController _khachhang_matkhau2 = TextEditingController();
  RestApi restAPI = RestApi();
  Shpre shpre = Shpre();
  List<dynamic> body = [];
  void chonNgay() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2021, 12),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.green,
                onPrimary: Colors.black,
                surface: Colors.green,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.green[200],
            ),
            child: picker!,
          );
        }).then((selectedDate) {
      //TODO: handle selected date
      if (selectedDate != null) {
        //_khachhang_ngaysinh.text = selectedDate.toString();

        var formatter = new DateFormat('dd/MM/yyyy');
        _khachhang_ngaysinh.text = formatter.format(selectedDate);
        print(_khachhang_ngaysinh.text);
      }
    });
  }

  late String tenLoi;
  bool kiemTraHopLe() {
    tenLoi = "";
    if (_khachhang_sdt.text.contains(' ')) {
      tenLoi = "Có khoảng trống trong số điện thoại";
      return false;
    }
    if (_khachhang_sdt.text == "") {
      tenLoi = "Số điện thoại rỗng";
      return false;
    }
    if (_khachhang_matkhau.text == "") {
      tenLoi = "Mật khẩu rỗng";
      return false;
    }
    if (_khachhang_matkhau.text.contains(' ')) {
      tenLoi = "Có khoảng trống trong mật khẩu";
      return false;
    }
    if (_khachhang_matkhau.text != _khachhang_matkhau2.text) {
      // ketqua = false;
      tenLoi = "Mật khẩu không khớp nhau";
      return false;
    }
    if (_khachhang_ten.text == "") {
      tenLoi = "Họ tên rỗng";
      return false;
    }
    if (_khachhang_diachi.text == "") {
      tenLoi = "Địa chỉ rỗng";
      return false;
    }
    if (_khachhang_ngaysinh.text == "") {
      tenLoi = "Ngày sinh rỗng";
      return false;
    }

    return true;
  }

  Secure maHoa = Secure();
  void dangKy(Customer customer) {
    Future<bool> response = restAPI.signUp(customer);
    response.then(
      (value) => {
        if (value)
          {
            print("Đăng ký thành công"),
            dangNhap(int.parse(_khachhang_sdt.text),
                maHoa.criptString(_khachhang_matkhau.text)),
          }
        else
          {
            baoLoi("Số điện thoại này đã được đăng ký"),
            print("Dk không thành công"),
          }
      },
    );
  }

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content: new Text("Bạn đã đăng ký thành công"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Trở lại TRANG CHỦ',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              //Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Nav(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void baoLoi(String tenLoi) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Lỗi"),
        content: new Text(tenLoi),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Kiểm tra lại',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              //Navigator.of(context).pop();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void dangNhap(int khachhang_sdt, String khachhang_matkhau) {
    Future<Response> response = restAPI.login(khachhang_sdt, khachhang_matkhau);
    response.then(
      (value) => {
        body = jsonDecode(value.body),
        print(body[0]["KHACHHANG_ID"]),
        print(body[0]["KHACHHANG_TEN"]),
        print(body[0]["KHACHHANG_ANH_URL"]),
        shpre.ganId(body[0]["KHACHHANG_ID"]),
        shpre.ganTen(body[0]["KHACHHANG_TEN"]),
        shpre.ganHinh(body[0]["KHACHHANG_ANH_URL"]),
        displayDialog(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      // decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/hinh.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          controller: _khachhang_sdt,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.phone),
                            labelText: 'Số điện thoại (dùng để đăng nhập)',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          controller: _khachhang_matkhau,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: 'Mật khẩu',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          controller: _khachhang_matkhau2,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            labelText: 'Xác nhận mật khẩu',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _khachhang_ten,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            labelText: 'Họ tên',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabled: false,
                                  labelText: 'Giới tính',
                                  labelStyle: TextStyle(color: Colors.green),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              hint: Text('Chọn giới tính'),
                              value: _khachhang_phai,
                              items: <String>['Nam', 'Nữ'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(
                                  () {
                                    _khachhang_phai = newValue!;
                                    print(_khachhang_phai);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _khachhang_diachi,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.location_city),
                            labelText:
                                'Địa chỉ (đây là địa chỉ giao hàng của bạn)',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          // enabled: false,
                          onTap: chonNgay,
                          controller: _khachhang_ngaysinh,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.access_time),
                            labelText: 'Ngày sinh',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Center(
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.green,
                          ),
                          child: CupertinoButton.filled(
                            onPressed: () {
                              if (kiemTraHopLe()) {
                                print(_khachhang_sdt.text);
                                print(_khachhang_matkhau.text);
                                Customer customer = Customer(
                                  KHACHHANG_TEN: _khachhang_ten.text,
                                  KHACHHANG_SDT: int.parse(_khachhang_sdt.text),
                                  KHACHHANG_PHAI: _khachhang_phai,
                                  KHACHHANG_DIACHI: _khachhang_diachi.text,
                                  KHACHHANG_NGAYSINH: _khachhang_ngaysinh.text,
                                  KHACHHANG_MATKHAU: maHoa
                                      .criptString(_khachhang_matkhau.text),
                                  KHACHHANG_ANH_URL:
                                      "images/avatarcustomer/noname.jpg",
                                );
                                dangKy(customer);
                              } else {
                                baoLoi(tenLoi);
                              }
                            },
                            child: Text("Đăng ký"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // Row(
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     children: [
                  //       const Icon(
                  //         Icons.chevron_right,
                  //         size: 30,
                  //         color: Colors.green,
                  //       ),
                  //       Spacer(),
                  //       Padding(
                  //         padding: const EdgeInsets.all(20),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           // ignore: prefer_const_literals_to_create_immutables
                  //           children: [
                  //             const Text("Chưa có tài khoản?",
                  //                 style: TextStyle(color: Colors.green)),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             ElevatedButton(
                  //               onPressed: () {},
                  //               child: Text("Đăng ký ngay"),
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
