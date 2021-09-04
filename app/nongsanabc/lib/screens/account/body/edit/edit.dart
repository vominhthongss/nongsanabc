import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/theme.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _khachhang_ten = TextEditingController();
  late String _khachhang_phai = "Nam";
  final TextEditingController _khachhang_diachi = TextEditingController();
  final TextEditingController _khachhang_ngaysinh = TextEditingController();
  RestApi restAPI = RestApi();
  Shpre shpre = Shpre();
  late Future<bool> response;
  late String tenLoi;
  bool kiemTraHopLe() {
    tenLoi = "";
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

  void chinhSua() {
    Future<int> _id = shpre.layId();
    _id.then(
      (khachhang_id) => {
        print(khachhang_id),
        response = restAPI.updateInfo(
            khachhang_id,
            _khachhang_ten.text,
            _khachhang_phai.toString(),
            _khachhang_diachi.text,
            _khachhang_ngaysinh.text),
        response.then(
          (value) => {
            if (value)
              {
                print("Cập nhật thành công"),
                shpre.ganTen(_khachhang_ten.text),
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

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content: new Text("Chỉnh sửa thành công"),
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
                        //   color: Colors.white,
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
                      width: 25,
                    ),
                    Text(
                      "CHỈNH SỬA THÔNG TIN",
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
                                items:
                                    <String>['Nam', 'Nữ'].map((String value) {
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
                            width: 220,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.green,
                            ),
                            child: CupertinoButton.filled(
                              onPressed: () {
                                if (kiemTraHopLe()) {
                                  chinhSua();
                                } else {
                                  baoLoi(tenLoi);
                                }
                              },
                              child: Text("Chỉnh sửa"),
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
