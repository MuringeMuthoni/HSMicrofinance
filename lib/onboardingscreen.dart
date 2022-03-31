import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:love/intro_screens/intro_page_1.dart';
import 'package:love/intro_screens/intro_page_2.dart';
import 'package:love/intro_screens/intro_page_3.dart';
import 'package:love/background.dart';
//import 'package:love/login_widget.dart';

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);
  @override
  _onboardingscreenState createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  PageController _controller = PageController();
  bool OnLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                    //     _controller.nextPage(
                    //         duration:Duration(milliseconds: 500),
                    //         curve: Curves.easeIn,
                    //     );
                  },
                  child: Text('Skip'),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                OnLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Background();
                              },
                            ),
                          );
                          // _controller.nextPage(
                          //     duration:Duration(milliseconds: 500),
                          //     curve: Curves.easeIn,
                          // );
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
