import 'package:flutter/material.dart';
class ImageWithGradient extends StatelessWidget {

  final String _backgroundImage;

  ImageWithGradient(this._backgroundImage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          _backgroundImage,
//          colorBlendMode: BlendMode.overlay,
//          color: Colors.blue,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: 0.85,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color(0xFF480048),
                      Color(0xFFC04848),
                    ],
                    stops: [0.0, 1.0]
                )
            ),
          ),
        )

      ],
    );
  }
}
