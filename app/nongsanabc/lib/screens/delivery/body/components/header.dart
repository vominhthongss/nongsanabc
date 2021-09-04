import 'package:flutter/cupertino.dart';
import 'package:nongsanabc/theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(20),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15)),
          //color: MyTheme.colorButton,
          child: Center(
            child: Text(
              "ĐƠN HÀNG CỦA BẠN",
              style: MyTheme.heading1,
            ),
          ),
        ),
      ),
    ]);
  }
}
