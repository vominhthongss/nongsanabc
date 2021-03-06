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
      tenLoi = "C?? kho???ng tr???ng trong s??? ??i???n tho???i";
      return false;
    }
    if (_khachhang_sdt.text == "") {
      tenLoi = "S??? ??i???n tho???i r???ng";
      return false;
    }
    if (_khachhang_matkhau.text == "") {
      tenLoi = "M???t kh???u r???ng";
      return false;
    }
    if (_khachhang_matkhau.text.contains(' ')) {
      tenLoi = "C?? kho???ng tr???ng trong m???t kh???u";
      return false;
    }
    if (_khachhang_matkhau.text != _khachhang_matkhau2.text) {
      // ketqua = false;
      tenLoi = "M???t kh???u kh??ng kh???p nhau";
      return false;
    }
    if (_khachhang_ten.text == "") {
      tenLoi = "H??? t??n r???ng";
      return false;
    }
    if (_khachhang_diachi.text == "") {
      tenLoi = "?????a ch??? r???ng";
      return false;
    }
    if (_khachhang_ngaysinh.text == "") {
      tenLoi = "Ng??y sinh r???ng";
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
            print("????ng k?? th??nh c??ng"),
            dangNhap(int.parse(_khachhang_sdt.text),
                maHoa.criptString(_khachhang_matkhau.text)),
          }
        else
          {
            baoLoi("S??? ??i???n tho???i n??y ???? ???????c ????ng k??"),
            print("Dk kh??ng th??nh c??ng"),
          }
      },
    );
  }

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Th??ng b??o"),
        content: new Text("B???n ???? ????ng k?? th??nh c??ng"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Tr??? l???i TRANG CH???',
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
        title: new Text("L???i"),
        content: new Text(tenLoi),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Ki???m tra l???i',
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
                            labelText: 'S??? ??i???n tho???i (d??ng ????? ????ng nh???p)',
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
                            labelText: 'M???t kh???u',
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
                            labelText: 'X??c nh???n m???t kh???u',
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
                            labelText: 'H??? t??n',
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
                                  labelText: 'Gi???i t??nh',
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
                              hint: Text('Ch???n gi???i t??nh'),
                              value: _khachhang_phai,
                              items: <String>['Nam', 'N???'].map((String value) {
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
                                '?????a ch??? (????y l?? ?????a ch??? giao h??ng c???a b???n)',
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
                            labelText: 'Ng??y sinh',
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
                            child: Text("????ng k??"),
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
                  //             const Text("Ch??a c?? t??i kho???n?",
                  //                 style: TextStyle(color: Colors.green)),
                  //             const SizedBox(
                  //               height: 10,
                  //             ),
                  //             ElevatedButton(
                  //               onPressed: () {},
                  //               child: Text("????ng k?? ngay"),
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
