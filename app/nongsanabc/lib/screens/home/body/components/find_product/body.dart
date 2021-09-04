import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/config.dart';
import 'package:nongsanabc/model/product.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/screens/home/body/components/product_card.dart';

class Body extends StatefulWidget {
  final String findWord;
  const Body({Key? key, required this.findWord}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  RestApi restApi = RestApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: restApi.fetchFindProduct(http.Client(), widget.findWord),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? FindingProducts(ds: snapshot.data!)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class FindingProducts extends StatelessWidget {
  final List<Product> ds;

  const FindingProducts({Key? key, required this.ds}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 0, top: 5, bottom: 40),
      child: ListView.builder(
        itemCount: ds.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0
                  ? Row(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          //color: Colors.white,
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        Text(
                          "TÌM SẢN PHẨM",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Text(""),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ProductCard(
                  SANPHAM_ID: ds[index].SANPHAM_ID.toString(),
                  LOAI_TEN: ds[index].LOAI_TEN,
                  SANPHAM_TEN: ds[index].SANPHAM_TEN,
                  SANPHAM_DONGIA: ds[index].SANPHAM_DONGIA,
                  SANPHAM_SOSAO: ds[index].TBSAO,
                  SANPHAM_URL: HOST_URL + ds[index].SANPHAM_URL,
                  SANPHAM_MOTA: ds[index].SANPHAM_MOTA,
                  SANPHAM_SOLUONG: ds[index].SANPHAM_SOLUONG,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
