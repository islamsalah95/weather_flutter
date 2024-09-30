import 'package:block/Views/Home.dart';
import 'package:block/Views/OnBoarding.dart';
import 'package:block/Views/SearchView.dart';
import 'package:block/cubit/counter_cubit.dart';
import 'package:block/cubit/get_weather_cubit.dart';
import 'package:block/cubit/theme_cubit.dart';
import 'package:block/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block/Views/HomeCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetWeatherCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          if (state is ThemeInitial) {
            return MaterialApp(
              theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan),
                  textTheme: const TextTheme(
                    bodySmall: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyMedium: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyLarge: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              title: 'Weather',
              debugShowCheckedModeBanner: false,
              routes: {
                Home.routeName: (context) => Home(),
                OnBoarding.routeName: (context) => OnBoarding(),
                SearchView.routeName: (context) => SearchView()
              },
              initialRoute: Home.routeName,
            );
          } else if (state is ThemeChange) {
            return MaterialApp(
              theme: ThemeData(
                  brightness:
                      state.value == "on" ? Brightness.dark : Brightness.light,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan),
                  textTheme: const TextTheme(
                    bodySmall: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyMedium: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyLarge: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              title: 'Weather',
              debugShowCheckedModeBanner: false,
              routes: {
                OnBoarding.routeName: (context) => OnBoarding(),
                Home.routeName: (context) => Home(),
                SearchView.routeName: (context) => SearchView()
              },
              initialRoute: OnBoarding.routeName,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
