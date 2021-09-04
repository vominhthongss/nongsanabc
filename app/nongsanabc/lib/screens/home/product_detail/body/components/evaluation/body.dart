import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/model/evaluation.dart';
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/screens/home/product_detail/body/components/evaluation/evaluation_list.dart';

class Body extends StatefulWidget {
  final int SANPHAM_ID;

  const Body({Key? key, required this.SANPHAM_ID}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  RestApi restApi = RestApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Evaluation>>(
        future: restApi.fetchEvaluation(http.Client(), widget.SANPHAM_ID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Có lỗi!'),
            );
          } else if (snapshot.hasData) {
            return EvaluationList(evaluations: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
