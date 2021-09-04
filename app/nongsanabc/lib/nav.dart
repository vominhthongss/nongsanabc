//Trang điều hướng
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/screens/home/home_screen.dart';
import 'package:nongsanabc/screens/delivery/Delivery_screen.dart';
import 'package:nongsanabc/screens/account/account_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  //Tạo 1 list chứa 3 Trang
  late final List<Widget> _widgetOptions;
  // final List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(), // Trang chủ
  //   DeliveryScreen(), //Trang thông báo
  //   AccountScreen(), //Trang thông tin cá nhân
  // ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        _widgetOptions[2] = AccountScreen();
      }
      if (index == 1) {
        _widgetOptions[1] = DeliveryScreen();
      }
      if (index == 0) {
        _widgetOptions[0] = HomeScreen();
      }
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _widgetOptions = <Widget>[
      HomeScreen(), // Trang chủ
      DeliveryScreen(), //Trang thông báo
      AccountScreen(), //Trang thông tin cá nhân
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // dùng ngăn xếp lưu lại
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined),
            label: 'Đơn hàng của bạn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
