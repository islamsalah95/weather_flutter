import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.image, required this.description});
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
      Image.asset(image),
      Text(description)
      ],
    );
  }
}
