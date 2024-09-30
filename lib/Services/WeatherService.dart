import 'package:block/Models/Weathermodal.dart';
import 'package:dio/dio.dart';

class WeatherService {
  Future<List<Weathermodal>> getWeather({required String city}) async {
    try {
      final dio = Dio();
      final response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=5311abddfc1f4687a43205140242809&q=${city}&days=3&aqi=no&alerts=no');
      List<Weathermodal> wheathersList = [
        Weathermodal.fromJson(response.data, 0),
        Weathermodal.fromJson(response.data, 1),
        Weathermodal.fromJson(response.data, 2)
      ];

      return wheathersList;
    } on DioException catch (e) {
      throw Exception("Failed to fetch  weather data : ${e}");
    }
  }
}
