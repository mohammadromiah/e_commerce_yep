import 'package:yep_flutter_project/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyPurchases extends StatefulWidget {
  static const String id = '/Purch';
  @override
  _MyPurchasesState createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('MY Purchases'),
        iconTheme: IconThemeData(color: kMainColor),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.shopping_cart_outlined),),
                  title: Column(
                      children: [
                        Text('Total:',style: TextStyle(fontWeight: FontWeight.bold)),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(DateTime.now().toString(), style:TextStyle(color: Colors.grey)),
                        ), ]

                  ),


                ),

              )
          ),
        ],
      ),
    );


  }
}