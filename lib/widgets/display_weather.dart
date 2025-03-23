import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class weatherDisplay extends StatelessWidget {
  final Weather weather;
  const weatherDisplay({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [],),
      ),
    );
  }
}
