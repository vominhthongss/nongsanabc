// import 'package:flutter/cupertino.dart';
// import 'package:nongsanabc/model/todo.dart';

// class CheckOut extends StatelessWidget {
//   final List<Todo> ds;
//   CheckOut({
//     Key? key,
//     required this.ds,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ...List.generate(
//             ds.length,
//             (index) {
//               return Column(
//                 children: [
//                   Text(
//                     ds[index].SANPHAM_ID,
//                   ),
//                   Text(
//                     ds[index].SANPHAM_SOLUONG,
//                   ),
//                   Text(
//                     ds[index].KHACHHANG_ID,
//                   )
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
