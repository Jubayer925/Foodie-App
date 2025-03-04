import 'package:flutter/material.dart';
import 'package:foodie_app/pages/homepage.dart';
import 'package:foodie_app/pages/onboarding/onbrd_page1.dart';
import 'package:foodie_app/pages/onboarding/onbrd_page2.dart';
import 'package:foodie_app/pages/onboarding/onbrd_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  PageController pageController = PageController();
  String button_text = "Next";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          //Pageview
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              if (index == 2) {
                button_text = "Finish";
              } else {
                button_text = "Next";
              }
              setState(() {});
            },
            children: [OnbrdPage1(), OnbrdPage2(), OnbrdPage3()],
          ),

          //Page indicator and next button
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Column(
                children: [

                  //Page indicator
                  SmoothPageIndicator(
                      effect: SlideEffect(
                          activeDotColor: Colors.red,
                          dotWidth: 10,
                          dotHeight: 10),
                      controller: pageController,
                      count: 3),
                  SizedBox(
                    height: 15,
                  ),

                  //button using gesture
                  GestureDetector(
                    onTap: () {
                      if (pageController.page == 2) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      } else {
                        pageController.nextPage(
                            duration: Duration(microseconds: 1000),
                            curve: Curves.easeIn);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        button_text,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
