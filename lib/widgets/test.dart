// import 'package:flutter/material.dart';
// import 'package:sheff_new/data/chefsData.dart';
// import 'package:sheff_new/data/foodsData.dart';
//
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => TestState();
// }
//
// class TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     final chefsData = AppDataBase2.chefsData;
//     final foodsData = AppDataBase1.foodsData;
//     return SizedBox(
//       height: 400,
//       // width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           itemCount: chefsData.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             final chefData = chefsData[index];
//             final foodData = foodsData[index];
//             return Chefs(
//               themeData: themeData,
//               chefData: chefData,
//               foodData: foodData,
//             );
//           }),
//     );
//   }
// }
//
// class Chefs extends StatefulWidget {
//   final ThemeData themeData;
//   final ChefData chefData;
//   final ProductEntity foodData;
//
//   const Chefs({
//     Key? key,
//     required this.themeData,
//     required this.chefData,
//     required this.foodData,
//   }) : super(key: key);
//
//   @override
//   State<Chefs> createState() => _ChefsState();
// }
//
// class _ChefsState extends State<Chefs> {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     return SizedBox(
//       height: 275,
//       width: MediaQuery.of(context).size.width - 50,
//       child: Container(
//         height: 260,
//         margin: const EdgeInsets.all(3),
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 2,
//               ),
//             ],
//             borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(10.0)),
//               child: Image.asset(
//                 'assets/img/foodData/${widget.foodData.imageFood1}',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: 120,
//               left: 115,
//               child: Container(
//                 margin: const EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(68)),
//                 padding: const EdgeInsets.all(4),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(72),
//                   child: Image.asset(
//                     'assets/img/chefData/${widget.chefData.imageChef}',
//                     width: 70,
//                     height: 70,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 5,
//               left: 15,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(widget.chefData.chefFirstName,
//                           style: themeData.textTheme.bodyText1!
//                               .copyWith(height: 1.5)),
//                       const SizedBox(
//                         width: 4,
//                       ),
//                       Text(widget.chefData.chefLastName,
//                           style: themeData.textTheme.bodyText1!
//                               .copyWith(height: 1.5)),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       Row(children: [
//                         Text(
//                           widget.foodData.rate.toString(),
//                           style: themeData.textTheme.caption!
//                               .copyWith(color: themeData.primaryColor),
//                         ),
//                         const SizedBox(
//                           width: 2,
//                         ),
//                         Icon(
//                           Icons.star_outlined,
//                           size: 16,
//                           color: themeData.primaryColor,
//                         ),
//                       ]),
//                     ],
//                   ),
//                   Text(widget.chefData.foodType,
//                       style:
//                           themeData.textTheme.bodyText1!.copyWith(height: 1.5)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
