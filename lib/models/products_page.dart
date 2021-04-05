// // import 'package:ecommerce_mobile_app/constants/font_style.dart';
// // import 'package:ecommerce_mobile_app/constants/global_colors.dart';
// // import 'package:ecommerce_mobile_app/routes/my_activities/my_activities.dart';
// // import 'package:ecommerce_mobile_app/routes/my_cart/my_cart_screen.dart';
// // import 'package:ecommerce_mobile_app/routes/my_purchses/my_purchses.dart';
// // import 'package:ecommerce_mobile_app/routes/setting_screen/setting%20screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:yep_flutter_project/const.dart';
// import 'package:yep_flutter_project/screens/my_activities.dart';
// import 'package:yep_flutter_project/screens/my_purchses.dart';
// import '../widgets/CategoryItem.dart';
// import 'package:http/http.dart';
// import 'package:flutter_screenutil/screen_util.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:yep_flutter_project/api/api_manager.dart';
// import 'package:flutter/material.dart';
// import 'categories/Electronics.dart';
// import 'categories/Jewelery.dart';
// import 'categories/men.dart';
// import 'categories/women.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class ProductsScreen extends StatefulWidget {
//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }
//
// class _ProductsScreenState extends State<ProductsScreen>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//   int currentIndex = 0;
//   int index = 0;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCategory();
//
//     _tabController = TabController(length: 4, vsync: this);
//   }
//
//   List<String> choices = [];
//
//   Future fetchCategory() async {
//     List<String> finalCategoryList = [];
//     http
//         .get(Uri.https('https://fakestoreapi.herokuapp.com/products/categories'))
//         .then((http.Response response) async {
//       var category = await jsonDecode(response.body);
//       print(category);
//       print(category.runtimeType);
//
//       finalCategoryList = new List<String>.from(category);
//
//       print(finalCategoryList);
//       print(finalCategoryList.runtimeType);
//       for (String item in finalCategoryList) {
//         setState(() {
//           choices.add(item);
//           // isLoading = !isLoading;
//         });
//       }
//       print(choices);
//       setState(() => isLoading = false);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//
//             appBar: AppBar(
//              // iconTheme: IconThemeData(color: GlobalColors.whiteColor),
//               leading: Icon(Icons.menu),
//               centerTitle: true,
//         //      backgroundColor: GlobalColors.brownColor,
//               title: Text(
//                 'Products by categories',
//            //     style: FontStyles.pageTitle,
//               ),
//             ),
//     //  backgroundColor: GlobalColors.whiteColor,
//       body: Center(
//         child: CircularProgressIndicator(
//
//         ),
//       ),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//          //     backgroundColor: GlobalColors.brownColor,
//               title: Text(
//                 'Products by categories',
//           //      style: FontStyles.pageTitle,
//               ),
//               bottom: TabBar(
//                 isScrollable: true,
//                 tabs: choices
//                     .map(
//                       (e) => Tab(
//                         child: Text(
//                           e
//                       ),
//                     )
//                     .toList(),
//
//                 Controller: _tabController,
//            //     indicatorColor: GlobalColors.whiteColor,
//               ),
//               iconTheme: IconThemeData(color: GlobalColors.whiteColor),
//             ),
//             drawer: Drawer(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 30,
//                   ),
//                   DrawerHeader(
//                     child: Container(
//                       width: 350,
//                       height: 400,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/drawer.jpg'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.settings,
//                       color: GlobalColors.brownColor,
//                     ),
//                     title: Text(
//                       'Settings',
//                       style: TextStyle(
//                           color: GlobalColors.brownColor,
//                           fontFamily: "Mon",
//                           fontWeight: FontWeight.w600),
//                     ),
//                     onTap: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (ctx) => Setting()));
//                     },
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.shopping_cart_outlined,
//                       color: GlobalColors.brownColor,
//                     ),
//                     title: Text(
//                       'My Cart',
//                       style: TextStyle(
//                           color: GlobalColors.brownColor,
//                           fontFamily: "Mon",
//                           fontWeight: FontWeight.w600),
//                     ),
//                     onTap: () {
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (ctx) => MyCart()));
//                     },
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.account_balance_wallet_outlined,
//                       color: GlobalColors.brownColor,
//                     ),
//                     title: Text(
//                       'My Purchases',
//                       style: TextStyle(
//                           color: GlobalColors.brownColor,
//                           fontFamily: "Mon",
//                           fontWeight: FontWeight.w600),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (ctx) => MyPurchases()));
//                     },
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.list,
//                       color: GlobalColors.brownColor,
//                     ),
//                     title: Text(
//                       'My Activity',
//                       style: TextStyle(
//                           color: GlobalColors.brownColor,
//                           fontFamily: "Mon",
//                           fontWeight: FontWeight.w600),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (ctx) => MyActivities()));
//                     },
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.new_releases_outlined,
//                       color: GlobalColors.brownColor,
//                     ),
//                     title: Text(
//                       'About Us',
//                       style: TextStyle(
//                           color: GlobalColors.brownColor,
//                           fontFamily: "Mon",
//                           fontWeight: FontWeight.w600),
//                     ),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               controller: _tabController,
//               children: [
//                 ElectronicCategory(),
//                 JeweleryCategory(),
//                 MenCategory(),
//                 WomenCategory(),
//               ],
//             ),
//           );
//   }
// }
