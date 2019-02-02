import 'package:flutter/material.dart';
import 'package:salon_app/home/home_screen.dart';
import 'package:salon_app/onboarding/heading.dart';
import 'package:salon_app/onboarding/image_with_gradient.dart';

class MyLoginPage extends StatelessWidget {
  final String _subheading;
  final String _backgroundImage;
  final String _footer;

  MyLoginPage(this._subheading, this._backgroundImage, this._footer);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: Colors.blueAccent,
      ),
      ImageWithGradient(_backgroundImage),
      Column(
        children: <Widget>[
          HeadingWidget(),
          Container(
            padding: EdgeInsets.all(20.0),
          ),
          Text(_subheading,
              style: TextStyle(fontSize: 30.0, color: Colors.white)),
          Container(
            margin: EdgeInsets.all(50.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "you@example.com", labelText: "Email"),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Your password here...",
                          labelText: "Password"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: RaisedButton(
                        child: new Text(
                          'Login',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
          ),
          Text(_footer,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center)
        ],
      )
    ]);
  }
}
