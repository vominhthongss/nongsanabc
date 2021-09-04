import 'package:nongsanabc/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shpre {
  Future<int> layId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    if (id == null) {
      return 0;
    } else {
      return id;
    }
  }

  Future<String> layTen() async {
    final prefs = await SharedPreferences.getInstance();
    final ten = prefs.getString('ten');
    if (ten == null) {
      return "Bạn chưa đăng nhập";
    } else {
      return ten;
    }
  }

  Future<String> layHinh() async {
    final prefs = await SharedPreferences.getInstance();
    final hinh = prefs.getString('hinh');
    if (hinh == null) {
      return HOST_URL + "images/avatarcustomer/noname.jpg";
    } else {
      return hinh;
    }
  }

  Future<void> datLaiId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', 0);
  }

  Future<void> datLaiTen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ten', "Bạn chưa đăng nhập");
  }

  Future<void> datLaiHinh() async {
    ganHinh("images/avatarcustomer/noname.jpg");
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(
    //     'hinh', HOST_URL + "images/avatarcustomer/noname.jpg");
  }

  Future<void> ganId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  Future<void> ganTen(String ten) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ten', ten);
  }

  Future<void> ganHinh(String hinh) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('hinh', HOST_URL + hinh);
  }
}
