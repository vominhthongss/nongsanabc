import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';

import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/account/account_screen.dart';
import 'package:nongsanabc/screens/sign_up/sign_up.dart';
import 'package:nongsanabc/secure/secure.dart';
import 'package:nongsanabc/theme.dart';

// ignore: use_key_in_widget_constructors
class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _khachhang_sdt = TextEditingController();
  final TextEditingController _khachhang_matkhau = TextEditingController();
  RestApi restAPI = RestApi();
  Shpre shpre = Shpre();
  List<dynamic> body = [];
  void dangNhap(int khachhang_sdt, String khachhang_matkhau) {
    Future<Response> response = restAPI.login(khachhang_sdt, khachhang_matkhau);
    response.then(
      (value) => {
        print("====" + value.body),
        if (value.body == "0")
          {
            displayDialog(),
          }
        else
          {
            body = jsonDecode(value.body),
            print(body[0]["KHACHHANG_ID"]),
            print(body[0]["KHACHHANG_TEN"]),
            print(body[0]["KHACHHANG_ANH_URL"]),
            shpre.ganId(body[0]["KHACHHANG_ID"]),
            shpre.ganTen(body[0]["KHACHHANG_TEN"]),
            shpre.ganHinh(body[0]["KHACHHANG_ANH_URL"]),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Nav(),
              ),
            ),
          },
      },
    );
  }

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content: new Text("Bạn nhập sai tài khoản hoặc mật khẩu"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Xin lỗi, tui nhầm tí :D',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Secure maHoa = Secure();
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Image.asset("assets/images/hinh.png"),
                  // ),
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
                            suffixIcon: Icon(Icons.person),
                            labelText: 'Số điện thoại',
                            labelStyle: TextStyle(color: Colors.green),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
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
                          width: 150,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.green,
                          ),
                          child: CupertinoButton.filled(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              print(_khachhang_sdt.text);
                              print(_khachhang_matkhau.text);

                              dangNhap(int.parse(_khachhang_sdt.text),
                                  maHoa.criptString(_khachhang_matkhau.text));
                            },
                            child: Text("Đăng nhập"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: Colors.green,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text("Chưa có tài khoản?",
                                  style: TextStyle(color: Colors.red)),
                              const SizedBox(
                                height: 10,
                              ),
                              CupertinoButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text("Đăng ký ngay"),
                              ),
                            ],
                          ),
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
