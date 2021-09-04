import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/secure/secure.dart';
import 'package:nongsanabc/theme.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _khachhang_matkhau = TextEditingController();
  final TextEditingController _khachhang_matkhau2 = TextEditingController();
  RestApi restAPI = RestApi();
  Shpre shpre = Shpre();
  late String tenLoi;
  late Future<bool> response;
  bool kiemTraHopLe() {
    tenLoi = "";

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

    return true;
  }

  void doiMatKhau() {
    Future<int> _id = shpre.layId();
    _id.then(
      (khachhang_id) => {
        print(khachhang_id),
        response = restAPI.changePassword(
            khachhang_id, maHoa.criptString(_khachhang_matkhau.text)),
        response.then(
          (value) => {
            if (value)
              {
                print("Đổi mật khẩu thành công"),
                displayDialog(),
              }
            else
              {
                print("Không thành công "),
              }
          },
        ),
      },
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

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content: new Text("Đổi mật khẩu thành công"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Trở về TRANG CHỦ',
              style: MyTheme.normalFont,
            ),
            onPressed: () {
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

  Secure maHoa = Secure();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 35),
        // decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        //color: Colors.white,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "ĐỔI MẬT KHẨU",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
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
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.green,
                            ),
                            child: CupertinoButton.filled(
                              onPressed: () {
                                if (kiemTraHopLe()) {
                                  doiMatKhau();
                                } else {
                                  baoLoi(tenLoi);
                                }
                              },
                              child: Text("Đổi mật khẩu"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
