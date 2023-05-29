import 'package:elderly_squire_capstone/HomePage.dart';
import 'package:elderly_squire_capstone/HomePage2.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  final String email;
  IntroSliderPage({Key key, this.email}) :super(key: key);


  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {



  List<Slide> slides = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      new Slide(
        title: "Welcome to Elderly Squire",
        description:
            "A mobile medication reminder app built for elderly. Anytime Anywhere",
        pathImage: "assets/images/nursing.jpg",
          heightImage: 90,
          widthImage: 125
      ),
    );
    slides.add(
      new Slide(
        backgroundImage: "assets/images/nursing.jpg",
        title: "Medication Reminder",
        description: "A reminder feature for medication intake and timed dosage",
        pathImage: "assets/images/nursing.jpg",
          heightImage: 90,
          widthImage: 125
      ),
    );
    slides.add(
      new Slide(
        title: "Health Tips",
        description: "Some health tips for elderly healthy lifestyle",
        pathImage: "assets/images/nursing.jpg",
          heightImage: 90,
        widthImage: 125
      ),
    );
    slides.add(
      new Slide(
        title: "Chat Support",
        description: "Elderly assistance on the go",
        pathImage: "assets/images/nursing.jpg",
          heightImage: 90,
          widthImage: 125
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
//                Container(
//                  padding: EdgeInsets.all(20),
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    color: Colors.white,
//                  ),
//                  child: Image.asset(
//                    currentSlide.pathImage,
//                    matchTextDirection: true,
//                    height: 60,
//                  ),
//                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    var email;
    return IntroSlider(
      backgroundColorAllSlides: Colors.orangeAccent,
      renderSkipBtn: Text("Skip"),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(color:  Colors.orangeAccent),
      ),
      renderDoneBtn: Text(
        "Done",
        style: TextStyle(color:  Colors.orangeAccent),
      ),
      colorDoneBtn: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home2(email: email),
        ),
      ),
    );
  }
}
