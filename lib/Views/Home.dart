// home.dart
import 'package:block/Models/Weathermodal.dart';
import 'package:block/Views/SearchView.dart';
import 'package:block/cubit/get_weather_cubit.dart';
import 'package:block/cubit/theme_cubit.dart';
import 'package:block/widgets/NoWeatherWidget.dart';
import 'package:block/widgets/WeatherWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Weathermodal> weatherList = [];

  void _updateWeatherList(List<Weathermodal> newWeatherList) {
    setState(() {
      weatherList = newWeatherList;
    });
  }

  void _handleSearch() {
    Navigator.pushNamed(context, SearchView.routeName, arguments: {
      'weatherList': weatherList,
      'onWeatherListChanged': _updateWeatherList,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _handleSearch,
              icon: const Icon(Icons.search),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.nights_stay),
            onPressed: () {
              context.read<ThemeCubit>().changeTheme(); // Change theme action
            },
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            if (state is GetWeatherLoading) {
              return WeatherWidget(weatheList: state.weathers);
            } else {
              return NoWeatherWidget();
            }
          },
        ));
  }
}
