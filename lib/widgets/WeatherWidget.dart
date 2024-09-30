// weatherwidget.dart
import 'package:block/Models/Weathermodal.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.weatheList});
  final List<Weathermodal> weatheList;

  @override
  Widget build(BuildContext context) {
    if (weatheList.isEmpty) {
      return const Center(child: Text("No weather data available"));
    }

    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatheList[index].cityName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Image.network(
                  weatheList[index].iconUrl,
                  width: 100,
                  height: 100,
                ),
                Text(
                  weatheList[index].weatherStateName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  weatheList[index].date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Temp: ${weatheList[index].avegTemp.toString()}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Min: ${weatheList[index].minTemp.toString()}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Max: ${weatheList[index].maxTemp.toString()}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: weatheList.length,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
