import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService =
      WeatherService(apikey: dotenv.env['OPEN_WEATHER_API_KEY'] ?? "");
  Weather? _weather;

  //methods to fetch the weather data
  void fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherFromLocation();
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      print("Error from  weather data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
