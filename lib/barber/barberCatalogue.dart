import 'package:flutter/material.dart';
import 'package:salon_app/detail/booking.dart';
import 'package:salon_app/util/custom_colors.dart';

class BarberCatalogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomColors customColors = CustomColors();
    return InkWell(
      onTap: (){},
      child: Container(
        height: 200.0,
        child: Card(
          margin: EdgeInsets.only(right: 4.0),
          child: Column(
            children: <Widget>[
                Image.asset("images/haircut.jpg",width: 150.0,height:150.0,fit: BoxFit.fill,),
              Text("Mohawk",style: TextStyle(color: customColors.accentColor,fontSize: 20.0,),),
              Text("\$10",style: TextStyle(color: customColors.primaryTextColor),)
            ],
          ),
          elevation: 2.0,
        ),
      ),
    );
  }
}
