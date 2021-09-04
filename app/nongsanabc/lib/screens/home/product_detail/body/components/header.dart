import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/screens/home/product_detail/body/components/evaluation/all_evaluation.dart';
import 'package:nongsanabc/screens/processing.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.xuly,
    required this.SANPHAM_SOSAO,
    required this.SANPHAM_ID,
    required this.SANPHAM_URL,
    required this.SANPHAM_TEN,
    required this.LOAI_TEN,
    required this.SANPHAM_DONGIA,
    required this.SANPHAM_MOTA,
  }) : super(key: key);

  final Processing xuly;
  final String SANPHAM_SOSAO;
  final String SANPHAM_ID;
  final String SANPHAM_URL;
  final String SANPHAM_TEN;
  final String LOAI_TEN;
  final String SANPHAM_MOTA;
  final int SANPHAM_DONGIA;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                    //      color: Colors.white,
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    //    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Text(
                        xuly.xulysosao(SANPHAM_SOSAO),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        tooltip: "Bấm vào để xem các đánh giá",
                        iconSize: 20,
                        color: Colors.yellow[800],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllEvaluationScreen(
                                  SANPHAM_ID: int.parse(SANPHAM_ID)),
                            ),
                          );
                        },
                        icon: Icon(Icons.star),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // Text(SANPHAM_ID),
        // SizedBox(
        //   width: 300,
        //   child: AspectRatio(
        //     aspectRatio: 1,
        //     child: Hero(
        //       tag: SANPHAM_ID,
        //       child: ImageFromApi(URL: SANPHAM_URL),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 300,
          child: AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: Text(SANPHAM_ID),
                child: ImageFromApi(
                  URL: SANPHAM_URL,
                ),
              ),
            ),
          ),
        ),

        Text(LOAI_TEN),
        Text(
          SANPHAM_TEN,
          style: TextStyle(color: Colors.green[800], fontSize: 20),
          maxLines: 2,
        ),
        Text(
          xuly.xulytien(SANPHAM_DONGIA),
          style: TextStyle(color: Colors.red[800], fontSize: 30),
          maxLines: 2,
        ),
      ],
    );
  }
}
