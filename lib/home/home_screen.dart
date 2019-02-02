import 'package:flutter/material.dart';
import 'package:salon_app/home/catalogue.dart';
import 'package:salon_app/util/custom_colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomColors customColor = CustomColors();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cut & Trim"),
          backgroundColor: customColor.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 1000,
                    margin: EdgeInsets.all(10.0),
                    child: Image.asset(
                      "images/profile_overview.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  LastVisitCard(),
                  HaircutListMenu(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LastVisitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomColors customColor = CustomColors();
    return Card(
        elevation: 2.0,
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  "Last Visit",
                  style: TextStyle(
                      color: customColor.primaryColor, fontSize: 30.0),
                ),
                Text(
                  "3 months ago",
                  style: TextStyle(color: customColor.primaryTextColor),
                )
              ],
            )),
            RaisedButton(
              onPressed: () {},
              color: customColor.primaryColor,
              textColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "28 \nSeptember",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            )
          ],
        ));
  }
}

class HaircutListMenu extends StatelessWidget {
  final CustomColors customColor = CustomColors();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List<Widget>();
    for (var i = 0; i < 10; i++) {
      widgets.add(Catalogue());
    }
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            "Haircuts",
            textAlign: TextAlign.left,
            style: TextStyle(color: customColor.primaryColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0,bottom: 16.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widgets,
            ),
          ),
          Text(
            "Beard",
            textAlign: TextAlign.left,
            style: TextStyle(color: customColor.primaryColor),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0,bottom: 16.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widgets,
            ),
          )
        ],
      ),
    );
  }
}
