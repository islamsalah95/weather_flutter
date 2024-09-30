// searchview.dart
import 'package:block/Models/Weathermodal.dart';
import 'package:block/Services/WeatherService.dart';
import 'package:block/cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static String routeName = "SearchView";

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Weathermodal> weatherList = [];
  Function(List<Weathermodal>)? onWeatherListChanged;

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      weatherList = args['weatherList'];
      onWeatherListChanged = args['onWeatherListChanged'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Enter city'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<GetWeatherCubit, GetWeatherState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<GetWeatherCubit>(context).getWeather(city:_controller.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Search'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
