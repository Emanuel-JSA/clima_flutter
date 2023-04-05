import 'package:http/http.dart' as http;
import 'dart:convert';

const String apikey = '512cf1899a97d7cbfa7bf71ffe8fc313';
const String openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
const String foreCastURL = 'https://api.openweathermap.org/data/2.5/forecast';

class WheaterData {

  WheaterData({this.latitude = 0, this.longitude = 0});

  final double latitude;
  final double longitude;

   getData() async {
    http.Response response = await http.get(Uri.parse('$openWeatherURL?lat=$latitude&lon=$longitude&appid=$apikey&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load wheater data');
    }
  }

  getForecastData() async {
    http.Response response = await http.get(Uri.parse('$foreCastURL?lat=$latitude&lon=$longitude&appid=$apikey&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load wheater data');
    }
  }
}