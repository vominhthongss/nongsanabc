import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/account/body/edit/edit.dart';
import 'package:nongsanabc/screens/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'change_password/change_password.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int khachhang_id = 0;
  String khachhang_ten = "Bạn chưa đăng nhập";
  Shpre shpre = Shpre();
  // void dangNhap(int _id) {
  //   setState(() {
  //     shpre.ganId(_id);
  //     Future<int> id = shpre.layId();
  //     id.then((value) => {khachhang_id = value, print(khachhang_id)});
  //   });
  // }

  void dangXuat() {
    setState(() {
      shpre.datLaiId();
      shpre.datLaiHinh();

      Future<int> id = shpre.layId();
      id.then((value) => {khachhang_id = value, print(khachhang_id)});
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Nav(),
        ),
      );
    });
  }

  @override
  void initState() {
    setState(() {
      Future<int> id = shpre.layId();
      id.then((value) => {khachhang_id = value, print(khachhang_id)});
      Future<String> _tenkhachhang = shpre.layTen();
      _tenkhachhang.then((value) => {khachhang_ten = value});
    });
    super.initState();
  }

  //bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),

          //bỏ avt
          ProfilePic(khachhang_id: khachhang_id),

          SizedBox(height: 20),
          //Xử lý đăng nhập
          khachhang_id == 0
              ? ProfileMenu(
                  text: "Đăng nhập",
                  icone: Icon(
                    Icons.login,
                    color: Colors.black,
                  ),
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    ),
                  },
                )
              : ProfileMenu(
                  text: khachhang_ten,
                  icone: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(),
                      ),
                    ),
                  },
                ),
          //Xử lý đăng nhập

          ProfileMenu(
            text: "Trung tâm trợ giúp",
            icone: Icon(
              Icons.help_center,
              color: Colors.black,
            ),
            press: () {},
          ),
          ProfileMenu(
            text: "Cài đặt",
            icone: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            press: () {},
          ),
          khachhang_id == 0
              ? Text("")
              : ProfileMenu(
                  text: "Đổi mật khẩu",
                  icone: Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
          khachhang_id != 0
              ? ProfileMenu(
                  text: "Đăng xuất",
                  icone: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  press: () {
                    dangXuat();
                  },
                )
              : Text(""),

          //DARKMODE
          // CupertinoSwitch(
          //   value: isDarkMode,
          //   onChanged: (value) {
          //     setState(() {
          //       isDarkMode = value;
          //       DARKMODE = isDarkMode;
          //       print(isDarkMode);
          //     });
          //   },
          // ),
          //DARKMODE
        ],
      ),
    );
  }
}
