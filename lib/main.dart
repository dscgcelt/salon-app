import 'package:flutter/material.dart';
import 'package:salon_app/home/home_screen.dart';
import 'package:salon_app/onboarding/onboarding_screen.dart';

void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnBoardingApp(),
//    home: HomeScreen(),
  );
  runApp(app);
}
