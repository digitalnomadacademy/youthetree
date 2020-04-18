import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
          backgroundColor: Colors.lightGreen,
          title: "first slide...",
          centerWidget: Container(
              width: 210,
              height: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage('http://placekitten.com/200/300'))))),
    );
    slides.add(
      new Slide(
          backgroundColor: Colors.green,
          title: "second slide...",
          centerWidget: Container(
              width: 210,
              height: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          NetworkImage('https://placekitten.com/g/200/300'))))),
    );
    slides.add(
      new Slide(
          backgroundColor: Colors.teal,
          title: "third slide...",
          centerWidget: Container(
              width: 210,
              height: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          NetworkImage('https://placekitten.com/200/300'))))),
    );
  }

  void onDonePress() {
    // Done button is START button
    // TODO: go to next screen
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      nameNextBtn: ('SKIP'),
      isShowSkipBtn: false,
      nameDoneBtn: ('START'),
      sizeDot: 14,
      shouldHideStatusBar: false,
    );
  }
}
