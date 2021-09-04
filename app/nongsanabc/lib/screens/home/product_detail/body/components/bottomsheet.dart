// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class _BottomSheetContent extends StatelessWidget {
//   final String SANPHAM_ID;
//   final String SANPHAM_TEN;
//   final int SANPHAM_DONGIA;
//   final String SOLUONGMUA;
//   _BottomSheetContent({
//     Key? key,
//     required this.SANPHAM_ID,
//     required this.SANPHAM_TEN,
//     required this.SANPHAM_DONGIA,
//     required this.SOLUONGMUA,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: Column(
//         children: [
//           SizedBox(
//             height: 70,
//             child: Center(
//               child: Text(
//                 SANPHAM_TEN,
//                 // GalleryLocalizations.of(context).demoBottomSheetHeader,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const Divider(thickness: 1),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 21,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text("Sản phẩm " + index.toString()),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
