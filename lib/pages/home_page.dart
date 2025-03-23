import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/widgets/display_weather.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Easy Weather",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.light_mode),
          ),
        ],
      ),
      body: _weather != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherDisplay(weather: _weather!),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
