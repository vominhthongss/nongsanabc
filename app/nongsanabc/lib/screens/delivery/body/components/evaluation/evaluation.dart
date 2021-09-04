import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/nav.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/restAPI/shpre.dart';
import 'package:nongsanabc/theme.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class EvaluationScreen extends StatefulWidget {
  final String action;
  final String DATHANG_TRANGTHAI;
  final int DATHANG_ID;
  final int sanpham_id;
  final String sanpham_url;
  final String sanpham_ten;
  final int sanpham_dongia;
  final int chitietdathang_soluong;

  const EvaluationScreen(
      {Key? key,
      required this.DATHANG_TRANGTHAI,
      required this.DATHANG_ID,
      required this.sanpham_id,
      required this.sanpham_url,
      required this.sanpham_ten,
      required this.sanpham_dongia,
      required this.chitietdathang_soluong,
      required this.action})
      : super(key: key);
  @override
  _EvaluationScreenState createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  late double rating = 0.0;
  TextEditingController evaluation = TextEditingController();
  FocusNode node = FocusNode();
  Shpre shpre = Shpre();
  RestApi restApi = RestApi();
  late Future<bool> response;
  bool checkBeforeSubmit() {
    bool check = true;
    if (rating == 0.0 || evaluation.text == "") {
      check = false;
    }

    return check;
  }

  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Thông báo"),
        content:
            new Text("Bạn chưa chọn số sao \n hoặc \n chưa nhập đánh giá ! "),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Đóng',
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

  void submitEvaluation() {
    Future<int> _id = shpre.layId();
    _id.then(
      (khachhang_id) => {
        response = restApi.submitEvaluation(khachhang_id, widget.sanpham_id,
            evaluation.text, rating.toString()),
        response.then(
          (value) => {
            if (value)
              {
                print("Thành công"),
                Navigator.pop(context),
              }
            else
              print("Không thành công"),
          },
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Header(),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.sanpham_ten,
                    style: MyTheme.heading1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 250,
                    child: ImageFromApi(URL: HOST_URL + widget.sanpham_url),
                  ),
                  SmoothStarRating(
                    onRated: (v) {
                      rating = v;
                      print(rating);
                    },
                    starCount: 5,
                    color: Colors.yellow[800],
                    borderColor: Colors.yellow[800],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: evaluation,
                      focusNode: node,
                      maxLines: 3,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () {
                            node.unfocus();
                          },
                          icon: Icon(Icons.check),
                        ),
                        labelText: "Nhập đánh giá của bạn",
                      ),
                    ),
                  ),
                  CupertinoButton.filled(
                    child: Text("Đánh giá"),
                    onPressed: () {
                      if (checkBeforeSubmit()) {
                        print("Số sao=" +
                            rating.toString() +
                            "Đánh giá= " +
                            evaluation.text);
                        submitEvaluation();
                      } else {
                        print("kiểm tra lại tính hợp lệ");
                        displayDialog();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
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
                  // color: Colors.white,
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
                width: 45,
              ),
              Text(
                "ĐÁNH GIÁ SẢN PHẨM",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
