import 'package:block/Views/Home.dart';
import 'package:block/widgets/OnboardingWidget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static String routeName = "onboardingScreen";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: [
                OnboardingWidget(image: "assets/1.jfif", description: "image 1"),
                OnboardingWidget(image: "assets/2.jfif", description: "image 2"),
                OnboardingWidget(image: "assets/3.webp", description: "image 3"),
                OnboardingWidget(image: "assets/4.avif", description: "image 4"),
                OnboardingWidget(image: "assets/5.jfif", description: "image 5"),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
                    effect: WormEffect(),
                  ),
                  Row(
                    children: [
                      Text("Current Index: $currentIndex"),
                      if (currentIndex == 4)
                        MaterialButton(
                          child: Text("Next"),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, Home.routeName);
                          },
                        )
                      else
                        MaterialButton(
                          child: Text("Back"),
                          onPressed: () {
                            if (currentIndex > 0) {
                              pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
