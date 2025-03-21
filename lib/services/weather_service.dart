import 'package:geocoding/geocoding.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/services/get_location_service.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  final String apikey;

  WeatherService({required this.apikey});

  //get the weather from city name
  Future<Weather> getWeather(String cityName) async {
    try {
      final url = '$BASE_URL?q=$cityName&appid=$apikey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Failed to load the weather data");
      }
    } catch (error) {
      throw Exception("Failed to load the weather data");
    }
  }

  //get the weather from the current location
  Future<Weather> getWeatherFromLocation() async {
    try {
      final location = GetLocationService();
      final cityName = await location.getCityNameFromLocation();

      final url = '$BASE_URL?q=$cityName&appid=$apikey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Failed to load the weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load the weather data");
    }
  }
}
