import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:yep_flutter_project/screens/my_activities.dart';
import 'package:yep_flutter_project/screens/my_purchses.dart';
import 'package:yep_flutter_project/screens/setting%20screen.dart';
import 'const.dart';
import 'screens/login/migrate.dart';
import 'screens/HomePage.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

       initialRoute: Spalsh.id,
       routes:
         {
           Spalsh.id: (context)=> Spalsh(),
           loginScreen.id: (context)=> loginScreen(),
           HomePage.id: (context)=>HomePage(),
           MyActivities.id: (context)=> MyActivities(),
           Setting.id:(context)=>Setting(),
           MyPurchases.id:(context)=>MyPurchases(),
         },
      title: 'E-Commerce',
      theme: ThemeData(
        fontFamily: 'cocon',
        primarySwatch: Colors.blue,
      ),
      // home: AnimatedSplashScreen(
      //     duration: 50000,
      //     splash: Padding(
      //       padding: EdgeInsets.only(top: 2),
      //       child: Column(
      //         //   //height: MediaQuery.of(context).size.height * .2,
      //         //   height: 400,
      //         //   width: 400,
      //         //   child: Stack(
      //         // alignment: Alignment.center,
      //         children: <Widget>[
      //
      //       Image.asset(
      //       "assets/images/logo.png",
      //         height: 25,
      //         width: 25,
      //       ),
      //
      //       SpinKitRipple(
      //         color: Colors.blue,
      //       )
      //         ],
      //       ),
      //     ),
      //  nextScreen: HomePage(),
      //  splashTransition: SplashTransition.slideTransition,
      //   pageTransitionType: PageTransitionType.scale,
    );
  }
}
