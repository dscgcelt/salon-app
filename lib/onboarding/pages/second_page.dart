import 'package:flutter/material.dart';
import 'package:salon_app/onboarding/heading.dart';
import 'package:salon_app/onboarding/image_with_gradient.dart';

class MySecondPage extends StatelessWidget {
  final String _subheading;
  final Image _icon;
  final String _backgroundImage;
  final String _footer;

  MySecondPage(this._subheading, this._icon, this._backgroundImage, this._footer);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(color: Colors.blueAccent,),
      ImageWithGradient(_backgroundImage),
      Column(
        children: <Widget>[
          HeadingWidget(),
          Container(padding: EdgeInsets.all(20.0),),
          Text(_subheading,style: TextStyle(fontSize: 30.0,color: Colors.white)),
          Container(
              margin: EdgeInsets.only(top: 50.0),
              child: _icon
          ),
          Container(padding: EdgeInsets.all(50.0),),
          Text(_footer,style: TextStyle(fontSize: 30.0,color: Colors.white,fontStyle: FontStyle.italic),textAlign: TextAlign.center)
        ],
      )
    ]);
  }
}
