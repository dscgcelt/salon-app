import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salon_app/onboarding/pages/first_page.dart';
import 'package:salon_app/onboarding/pages/login_page.dart';
import 'package:salon_app/onboarding/pages/second_page.dart';
import 'package:salon_app/onboarding/pages/third_page.dart';
import 'package:page_indicator/page_indicator.dart';


class OnBoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    List<Image> icons = List<Image>();
    icons.add(Image.asset("images/scissor_icon.png"));
    icons.add(Image.asset("images/massage_icon.png"));
    icons.add(Image.asset("images/shave_icon.png"));

    List<String> backgroundImages = List<String>();
    backgroundImages.add("images/haircut.jpg");
    backgroundImages.add("images/massage_pic.png");
    backgroundImages.add("images/shaving_pic.png");
    backgroundImages.add("images/salon_shop.png");

    final myController = PageController(
      initialPage: 0,
    );
    PageView pageView = PageView(
      controller: myController,
      children: <Widget>[
        MyFirstPage("Need a Haircut?",icons[0],backgroundImages[0],"Our barbers are \nthe best in town"),
        MySecondPage("Need a Massage?",icons[1],backgroundImages[1],"Let our massagers \nrelax you"),
        MyThirdPage("Need a Shave?",icons[2],backgroundImages[2],"Get your beard \ncleaned and trimmed"),
        MyLoginPage("Need an Appointment?",backgroundImages[3],"We won't disappoint you"),
      ],
      physics: BouncingScrollPhysics(),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(children: <Widget>[
        PageIndicatorContainer(
          pageView: pageView,
          length: 4,
          indicatorSpace: 10.0,
          indicatorSelectorColor:Color(0xFFf15e5e),
        ),
      ]),
    );
  }
}
