import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';

import 'package:nongsanabc/model/evaluation.dart';
import 'package:nongsanabc/restAPI/image_from_api.dart';
import 'package:nongsanabc/theme.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class EvaluationList extends StatelessWidget {
  final List<Evaluation> evaluations;
  const EvaluationList({
    Key? key,
    required this.evaluations,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return evaluations.length == 0
        ? Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 19,
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      //     color: Colors.white,
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : ListView.builder(
            itemCount: evaluations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    index == 0
                        ? Row(
                            children: [
                              SizedBox(
                                width: 11,
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  //       color: Colors.white,
                                  padding: EdgeInsets.zero,
                                  onPressed: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(""),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 100,
                      color: Colors.green,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: ImageFromApi(
                                  URL: HOST_URL +
                                      evaluations[index].KHACHHANG_ANH_URL),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  evaluations[index].KHACHHANG_TEN,
                                  style: MyTheme.normalFont,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: SmoothStarRating(
                                  isReadOnly: true,
                                  rating: double.parse(
                                      evaluations[index].DANHGIA_SOSAO),
                                ),
                                // child: Text(evaluations[index].DANHGIA_SOSAO),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(evaluations[index].DANHGIA_NOIDUNG),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Text(evaluations[index].KHACHHANG_TEN),
                    // Text(evaluations[index].KHACHHANG_ANH_URL),
                    // Text(evaluations[index].DANHGIA_NOIDUNG),
                    // Text(evaluations[index].DANHGIA_SOSAO),
                  ],
                ),
              );
            },
          );
  }
}
