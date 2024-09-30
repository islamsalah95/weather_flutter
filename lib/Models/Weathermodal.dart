class Weathermodal {
  final String cityName;
  final String date;
  final double avegTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherStateName;
  final String icon;

  Weathermodal(
      {
      required this.cityName,
      required this.date,
      required this.avegTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName,
      required this.icon
      });

  factory Weathermodal.fromJson(json,int index) {
    return Weathermodal(
      cityName: json['location']['name'],
      date: json['forecast']['forecastday'][index]['date'], 
      avegTemp: json['forecast']['forecastday'][index]['day']['avgtemp_c'],
      minTemp:json['forecast']['forecastday'][index]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][index]['day']['maxtemp_c'],
      weatherStateName: json['forecast']['forecastday'][index]['day']['condition']['text'],
      icon: json['forecast']['forecastday'][index]['day']['condition']['icon'],
    );
  }
  
    String get iconUrl {
    return 'https://cdn.weatherapi.com/weather/64x64/day/${icon.split('/').last}';
  }
  
    String toString() {
    return 'Weathermodal{cityName: $cityName, date: $date, avegTemp: $avegTemp, minTemp: $minTemp, maxTemp: $maxTemp, weatherStateName: $weatherStateName, icon: $icon}';
  }
}
