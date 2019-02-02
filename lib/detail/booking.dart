import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_app/home/catalogue.dart';
import 'package:salon_app/util/custom_colors.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  TimeOfDay time;
  @override
  Widget build(BuildContext context) {
    CustomColors customColors = CustomColors();
    List<Widget> widgets = List<Widget>();
    for (var i = 0; i < 10; i++) {
      widgets.add(Catalogue());
    }
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Book your appointment"),
          backgroundColor: customColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0)),
                Center(
                    child: Image.asset(
                      "images/haircut.jpg",
                      height: 300,
                      width: 300,
                    )),
                Text("Mohawk"),
                new ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Date",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.access_time),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Timing",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.speaker_notes),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Extra Notes",
                    ),
                  ),
                ),
                const Divider(
                  height: 8.0,
                ),
                Text(
                  "Pick Your barber",
                  style: TextStyle(color: customColors.primaryColor),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0,bottom: 16.0),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widgets,
                  ),
                ),
                RaisedButton(onPressed: (){},child: Text("Pick your barber"),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
