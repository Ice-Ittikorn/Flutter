import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007AFF),
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F8FF),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: WeatherCard(
              city: 'Bangkok',
              temperature: 32.5,
              condition: 'sunny',
              humidity: 65,
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  IconData _getWeatherIcon(String cond) {
    switch (cond.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.water_drop;
      default:
        return Icons.help_outline;
    }
  }

  Color _getIconColor(String cond) {
    switch (cond.toLowerCase()) {
      case 'sunny':
        return Colors.orangeAccent;
      case 'cloudy':
        return Colors.blueGrey;
      case 'rainy':
        return const Color(0xFF007AFF);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color(0xFF007AFF).withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      color: Colors.white,
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, const Color(0xFFE6F2FF)],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${temperature.toStringAsFixed(1)}°C',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF007AFF),
                    letterSpacing: -1,
                  ),
                ),
                Icon(
                  _getWeatherIcon(condition),
                  size: 56,
                  color: _getIconColor(condition),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: const Color(0xFF007AFF).withOpacity(0.15),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.opacity, size: 20, color: Color(0xFF007AFF)),
                const SizedBox(width: 8),
                const Text(
                  'Humidity',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '$humidity%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1C1E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
