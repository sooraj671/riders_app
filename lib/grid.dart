// import 'package:riders_app/api/api_methods.dart';
// import 'package:riders_app/constants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'api/ProductList.dart';
// import 'api/products.dart';
//
//
// List<Product> product_list =[];
//
// class GridB extends StatefulWidget {
//   const GridB({Key? key}) : super(key: key);
//
//   @override
//   State<GridB> createState() => _GridBState();
//
//
//
//
// }
//
//
// class _GridBState extends State<GridB> {
//
//   void my(){
//     setState(() {
//       showPopUp("here");
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     product_list = list;
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 12.0,
//         mainAxisExtent: 230,
//       ),
//       itemCount: product_list.length,
//       itemBuilder: (_, index) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               16.0,
//             ),
//             color: kPrimaryColor,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16.0),
//                   topRight: Radius.circular(16.0),
//                 ),
//                 //"https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/uploads/16561972-shawl.png"
//                 child: Image.network(
//                   "${product_list[index].imgUrl}",
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "${product_list[index].name}",
//                           style: Theme.of(context).textTheme.subtitle1!.merge(
//                             const TextStyle(
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Price: ${product_list[index].price}",
//                           style: Theme.of(context).textTheme.subtitle2!.merge(
//                             TextStyle(
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//
//                     const SizedBox(
//                       width: 8.0,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         CupertinoIcons.cart,
//
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
