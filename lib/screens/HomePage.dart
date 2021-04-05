import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yep_flutter_project/const.dart';
import 'package:yep_flutter_project/screens/my_activities.dart';
import 'package:yep_flutter_project/screens/my_purchses.dart';
import 'ProductPage.dart';
import '../widgets/CategoryItem.dart';
import 'package:http/http.dart';
import 'setting screen.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:yep_flutter_project/api/api_manager.dart';
class ScreensHelper {
  static double width;
  static double height;

  ScreensHelper(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static fromWidth(double percent) {
    assert(percent != null && percent >= 0.0 && percent <= 100.0);
    return (percent/100.0) * width;
  }

  static fromHeight(double percent) {
    assert(percent != null && percent >= 0.0 && percent <= 100.0);
    return ((percent/100.0) * height);
  }

  static scaleText(double fontSize, {bool allowFontScalingSelf}) {
    return ScreenUtil().setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
  }
}


class HomePage extends StatefulWidget {
  static const String id = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiManager apiManager = ApiManager();
  List bannerAdSlider = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
    "assets/images/banner4.jpg",
    "assets/images/banner5.jpg",
    "assets/images/banner6.jpg",
    "assets/images/banner7.jpg",
    "assets/images/banner8.jpg"
  ];

  // List<Product> products = [
  //   Product(
  //       image: "assets/product1.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "iPad mini"),
  //   Product(
  //       image: "assets/product2.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "iPad Pro"),
  //   Product(
  //       image: "assets/product3.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "iPhone Pro Max"),
  //   Product(
  //       image: "assets/product4.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Apple Watch Series 3"),
  //   Product(
  //       image: "assets/product5.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Apple Watch Series 4"),
  //   Product(
  //       image: "assets/product6.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Macbook Pro 16 inch"),
  //   Product(
  //       image: "assets/product7.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Macbook Pro"),
  //   Product(
  //       image: "assets/product8.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "iMac 4k Retina"),
  //   Product(
  //       image: "assets/product9.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "T-Shirts"),
  //   Product(
  //       image: "assets/product10.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Ethnic Wear - Dress"),
  //   Product(
  //       image: "assets/product11.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "Dress"),
  //   Product(
  //       image: "assets/product12.jpg",
  //       description:
  //           "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
  //       price: "100",
  //       productName: "T-Shirt"),
  // ];


  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      key: drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "E-Commerce",
          style: TextStyle(
            color: kMainColor,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: kMainColor),
        iconTheme: IconThemeData(color: kMainColor),
        leading: IconButton(
          onPressed: () {
            drawerKey.currentState.openDrawer();
          },
          icon: Icon(EvaIcons.menu2Outline),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.shoppingBagOutline),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(16),
              ),
              accountEmail: Text(
                "romiah@mail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              accountName: Text(
                "Mohammad Romiah",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,

                ),
              ),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.asset("assets/images/profile.jpg",width: 70,height: 70,),
                // Image(
                //  Image.asset("assets/images/profile.jpg"),
                //   width: 70,
                //   height: 70,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Home",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.homeOutline,color: kMainColor,),
              onTap:() {Navigator.of(context).pushNamed(HomePage.id);},
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("My Cart",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.creditCardOutline,color: kMainColor,),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("My Purchases",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.shoppingBagOutline,color: kMainColor,),
              onTap:() {Navigator.of(context).pushNamed(MyPurchases.id);},
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Setting",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.settings2Outline,color: kMainColor,),
              onTap:() {Navigator.of(context).pushNamed(Setting.id);},
            ),
            ListTile(
              title: Text("My Activities",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.activityOutline,color: kMainColor,),
              onTap:() {Navigator.of(context).pushNamed(MyActivities.id);},
            ),
            ListTile(
              title: Text("About",style: TextStyle(fontSize: 25),),
              leading: Icon(EvaIcons.infoOutline,color: kMainColor,),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: ListView(
                   scrollDirection: Axis.horizontal,
                   shrinkWrap: true,
                  children: <Widget>[
                    GestureDetector(
                      child: CategoryItem(
                        icon: EvaIcons.hardDrive,
                        size: 90,
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.black54,

                      ),
                        onTap:() {Navigator.of(context).pushNamed(MyActivities.id);},
                    ),
                    GestureDetector(
                      child: CategoryItem(
                        icon: EvaIcons.headphones,
                        size: 90,
                        margin: EdgeInsets.only(
                          left: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xFF91bfff),
                      ),
                      onTap:() {Navigator.of(context).pushNamed(MyActivities.id);},
                    ),
                    GestureDetector(
                      child: CategoryItem(
                        icon: EvaIcons.toggleRightOutline,
                        size: 90,
                        margin: EdgeInsets.only(
                          left: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xFFff91c1),
                      ),
                      onTap:() {Navigator.of(context).pushNamed(MyActivities.id);},
                    ),
                    GestureDetector(
                      child: CategoryItem(
                        icon: EvaIcons.printerOutline,
                        size: 90,
                        margin: EdgeInsets.only(
                          left: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xFF5340de),
                      ),
                      onTap:() {Navigator.of(context).pushNamed(MyActivities.id);},
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              // banner ad slider

              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                ),
                items: bannerAdSlider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // banner ad slider

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),


              // GridView.count(
              //   physics: ClampingScrollPhysics(),
              //   crossAxisCount: 2,
              //   shrinkWrap: true,
              //   childAspectRatio: 1 / 1.25,
              //   children: Card.map((product) {
              //     return Stack(
              //       children: <Widget>[
              //         Container(
              //           child: Column(
              //             children: <Widget>[
              //               Hero(
              //                 tag: product.image,
              //                 child: AspectRatio(
              //                   aspectRatio: 1 / 1,
              //                   child: Image(
              //                     image: AssetImage(product.image),
              //                   ),
              //                 ),
              //               ),
              //               Text(
              //                 product.productName,
              //               ),
              //               Text(
              //                 "${product.price}\$",
              //                 style: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w700,
              //                   color: Colors.amber,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Material(
              //           color: Colors.transparent,
              //           child: InkWell(
              //             onTap: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => ProductPage(
              //                       product: product,
              //                     ),
              //                   ));
              //             },
              //           ),
              //         )
              //       ],
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
