import 'package:flutter/material.dart';
import 'package:yep_flutter_project/const.dart';
import 'package:yep_flutter_project/screens/login/migrate.dart';


class Spalsh extends StatefulWidget {
  static const String id = '/Spalsh';

  @override
  _SpalshState createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    // here to make the splash screen only show for specific amount of time
    // we use this in the init state and inside it we have the navigator so we tell it which page to go to after it
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(loginScreen.id);


      //setState(() {});            why when i  comment both of those it still works
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              Container(
                height: h * 0.1,
                child: Text(
                  'E-Commerce\n',
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
              ),
              // Container(
              //     height: h * 0.15,
              //     child: RichText(
              //       text: TextSpan(
              //         text: "first",
              //         style: TextStyle(color: Colors.grey[600], fontSize: 20),
              //         children: [
              //           TextSpan(
              //               text: "second",
              //               style: TextStyle(color: Color(0xffff4d4d))),
              //         ],
              //       ),
              //     )),
              Container(
                width: 240.0,
                height: h * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
              ),
              SizedBox(
                height: h * 0.2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.25),
                child: LinearProgressIndicator(
                  backgroundColor: kMainColor,
                  minHeight: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
