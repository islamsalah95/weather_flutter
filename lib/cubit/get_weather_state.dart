part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

class GetWeatherLoading extends GetWeatherState {
  List<Weathermodal> weathers;
  GetWeatherLoading(this.weathers);
}

class FailWeatherState extends GetWeatherState {
  dynamic  e;
  FailWeatherState(this.e);
}
