import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nongsanabc/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:nongsanabc/restAPI/rest_api.dart';
import 'package:nongsanabc/screens/home/body/components/giavi_product.dart';
import 'package:nongsanabc/screens/home/body/components/type_product.dart';

import 'popularproduct.dart';
import 'traicay_product.dart';

// ignore: must_be_immutable
class AllProduct extends StatelessWidget {
  RestApi restApi = RestApi();
  AllProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Product>>(
          future: restApi.fetchAllProduct(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? PopularProducts(ds: snapshot.data!)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        // SizedBox(height: 20),
        // FutureBuilder<List<Product>>(
        //   future: restApi.fetchProductType(http.Client(), "Gia vị"),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) print(snapshot.error);

        //     return snapshot.hasData
        //         ? GiaViProducts(ds: snapshot.data!)
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           );
        //   },
        // ),
        SizedBox(height: 20),
        FutureBuilder<List<Product>>(
          future: restApi.fetchProductType(http.Client(), "Gia vị"), ///////
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TypeProduct(
                    ds: snapshot.data!,
                    tenLoai: 'GIA VỊ PHỔ BIẾN',
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        SizedBox(height: 20),
        FutureBuilder<List<Product>>(
          future: restApi.fetchProductType(http.Client(), "Thức uống"), ///////
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TypeProduct(
                    ds: snapshot.data!,
                    tenLoai: 'THỨC UỐNG PHỔ BIẾN',
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        // SizedBox(height: 20),
        // FutureBuilder<List<Product>>(
        //   future: restApi.fetchProductType(http.Client(), "Trái cây"),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) print(snapshot.error);

        //     return snapshot.hasData
        //         ? TraiCayProducts(ds: snapshot.data!)
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           );
        //   },
        // ),
        SizedBox(height: 20),
        FutureBuilder<List<Product>>(
          future: restApi.fetchProductType(http.Client(), "Trái cây"), ///////
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TypeProduct(
                    ds: snapshot.data!,
                    tenLoai: 'TRÁI CÂY PHỔ BIẾN',
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        SizedBox(height: 20),
        FutureBuilder<List<Product>>(
          future: restApi.fetchProductType(http.Client(), "Rau củ"), ////////
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? TypeProduct(
                    ds: snapshot.data!,
                    tenLoai: 'RAU CỦ PHỔ BIẾN',
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ],
    );
  }
}
