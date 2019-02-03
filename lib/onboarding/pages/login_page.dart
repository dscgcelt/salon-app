import 'package:flutter/material.dart';
import 'package:salon_app/home/home_screen.dart';
import 'package:salon_app/onboarding/heading.dart';
import 'package:salon_app/onboarding/image_with_gradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyLoginPage extends StatelessWidget {
  final String _subheading;
  final String _backgroundImage;
  final String _footer;

  GoogleSignIn _googleSignIn = new GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;

  MyLoginPage(this._subheading, this._backgroundImage, this._footer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children: <Widget>[
      ImageWithGradient(_backgroundImage),
      ListView(
              children:<Widget>[ Column(
          children: <Widget>[
            HeadingWidget(),
            SizedBox(height: 10.0),
            // Container(
            //   padding: EdgeInsets.all(20.0),
            // ),
            Text(_subheading,
                style: TextStyle(fontSize: 30.0, color: Colors.white)),
                SizedBox(height: 10.0),
                _GoogleLoginBtn(context),
                SizedBox(height: 8.0),
                Text('OR',
                style: TextStyle(color: Colors.white),
                ),
            Container(
              margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 25.0),
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
            Text(_footer,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center)
          ],
        ),
              ],
      )

    ]
      
       ),
    );
  }
  Widget _GoogleLoginBtn(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        child:MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Log in with   ',
             style: TextStyle(fontSize: 20.0),
            ),
            Image(image: AssetImage('images/google_logo.png'),
             height: 60.0,
             width: 40.0,
             fit: BoxFit.contain,
            )
          ],
           
        ),
        splashColor: Colors.green,
        height: 45.0,
        minWidth: 45.0,
        onPressed: (){
           _googleSignIn.signIn().then((result){
             result.authentication.then((googleKey){
               _auth.signInWithGoogle(
                 accessToken: googleKey.accessToken,
                 idToken: googleKey.idToken,

               ).then((signedInUser){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=> HomeScreen())
                 );
                 print('Signed In user ${signedInUser.displayName}');

               }).catchError((e){
                 print(e);
               });
             }).catchError((e){
               print(e);
             });
           }).catchError((e){
             print(e);
           });
        },
      ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        elevation: 15.0,
      ),
    );
  }
}
