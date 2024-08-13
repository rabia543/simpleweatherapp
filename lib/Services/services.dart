import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/WeatherData.dart';
class WeatherServices{
  Future<Weatherdata?>fetchWeather()async{
    final response= await http.get(Uri.parse(
       'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=8bb00c9c8cc0abf94798dbdfe8cc8b13'
    ));
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print("JSON data received: $json"); // Debugging line
        return Weatherdata.fromJson(json);
      } else {
        print("Failed to load weather data. Status code: ${response.statusCode}");
        throw Exception("Failure has occurred to load weather data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: ${e.toString()}");
      return null;
    }
  }
}