

 // import 'package:flutter/material.dart';
//
// class exercise extends StatelessWidget {
//   const exercise ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         backgroundColor: Colors.green,
//         ),
//        body: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: double.infinity,
//               width: 100,
//               color: Colors.amber,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.blue,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.blue.shade200,
//                 ),
//
//
//             ),
//             Container(
//               height: double.infinity,
//               width: 100,
//               color: Colors.redAccent,
//             ),
//          ],
//
//         ),
//
//     );
//
//   }
// }


// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               BoxWidget(color: Colors.red, name: 'Box1'),
//               BoxWidget(color: Colors.blue, name: 'Box2'),
//               BoxWidget(color: Colors.green, name: 'Box3'),
//               BoxWidget(color: Colors.yellow, name: 'Box4'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BoxWidget extends StatelessWidget {
//   final Color color;
//   final String name;
//
//   BoxWidget({required this.color, required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color: color,
//       child: Center(
//         child: Text(
//           name,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }


