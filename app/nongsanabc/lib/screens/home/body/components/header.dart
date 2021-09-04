import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/cart/cart_screen.dart';
import 'package:nongsanabc/screens/home/body/components/find_product/find_product.dart';
import 'package:nongsanabc/screens/sign_in/sign_in.dart';
import 'package:nongsanabc/test.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Shpre shpre = Shpre();
  TextEditingController _findingWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/hinh.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            // height: MediaQuery.of(context).size.width * 0.2,
            padding: EdgeInsets.only(left: 5),
            child: TextField(
              controller: _findingWord,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                value = _findingWord.text;
                print(value);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindProductScreen(findWord: value),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "Tìm sản phẩm",
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width * 0.1,
          padding: EdgeInsets.only(right: 15, left: 20),
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Future<int> khachhang_id = shpre.layId();
              khachhang_id.then(
                (value) => {
                  if (value != 0)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            KHACHHANG_ID: value,
                          ),
                        ),
                      ),
                    }
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                    }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
