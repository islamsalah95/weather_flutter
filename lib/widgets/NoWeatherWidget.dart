import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5), // Add a border to the container
          color: Colors.grey[200], // Add a background color to the container
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Update this to minimize the column's height
          children: [
            Image.asset("assets/noweather.png"),
            const Text("No Weather Today")
          ],
        ),
      ),
    );
  }
}
