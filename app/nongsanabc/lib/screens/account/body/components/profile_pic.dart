//import 'dart:html';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/screens/account/account_screen.dart';
import 'package:nongsanabc/screens/sign_in/sign_in.dart';

class ProfilePic extends StatefulWidget {
  int khachhang_id;

  ProfilePic({
    Key? key,
    required this.khachhang_id,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late String hinh;
  Shpre shpre = Shpre();
  RestApi restApi = RestApi();
  late Future<String> _checkavt;

  void doiAnhDaiDien() {
    setState(() {
      Future<int> _id = shpre.layId();
      _id.then(
        (khachhang_id) => {
          if (khachhang_id == 0)
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              ),
            }
          else
            {
              print(khachhang_id),
              _checkavt = restApi.getImage(context, khachhang_id),
              _checkavt.then(
                (value) => setState(
                  () => {
                    shpre.datLaiHinh(),
                    shpre.ganHinh(value),
                    hinh = value,
                    shpre.ganHinh(value),
                    print("Cuối cùng set avatar=" + value),
                  },
                ),
              ),
            }
        },
      );
    });
  }

  void layHinh() {
    //shpre.datLaiHinh();
    Future<String> _hinh = shpre.layHinh();
    _hinh.then(
      (value) => {
        hinh = value,
        print("avatar=" + hinh),
      },
    );
  }

  @override
  void initState() {
    layHinh();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            // ignore: deprecated_member_use
            overflow: Overflow.visible,
            children: [
              //Xử lý avatar
              widget.khachhang_id == 0
                  ? Icon(
                      Icons.account_circle,
                      size: 120,
                    )
                  : CachedNetworkImage(
                      imageUrl: hinh,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              // : Image.network(
              //     hinh,
              //     fit: BoxFit.fitHeight,
              //   ),
              //: ImageFromApi(URL: hinh),
              // : Container(
              //     width: 200,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //         image: NetworkImage(hinh),
              //         fit: BoxFit.fitHeight,
              //       ),
              //     ),
              //   ),
              //Xử lý avatar

              Positioned(
                right: -16,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {
                      doiAnhDaiDien();
                    },
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
