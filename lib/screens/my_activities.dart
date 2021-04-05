
import 'package:flutter/material.dart';
import 'package:yep_flutter_project/const.dart';
class MyActivities extends StatefulWidget {
  static const String id = '/activity';
  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: kMainColor),
          title: Text('My Activities'),
        ),
        body: Container(
            child:Column(
              children: [
                ListTile(
                    leading: Icon(Icons.add_to_photos),
                    // title:,
                ),
                ListTile(
                    leading: Icon(Icons.login),
                    // title:
                ),
                ListTile(
                    leading: Icon(Icons.add_to_photos),
                    // title:
                ),
                ListTile(
                    leading: Icon(Icons.add_to_photos),
                    // title:
                ),
              ],
            )


        )
    );

  }
}