import 'package:flutter/material.dart';

// 1. THE MISSING ENTRY POINT
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: WeatherCard(
              cityName: 'Bangkok',
              temperature: 32.5,
              condition: WeatherCondition.sunny,
              humidity: 65,
            ),
          ),
        ),
      ),
    );
  }
}

// --- YOUR ORIGINAL CODE BELOW ---

enum WeatherCondition { sunny, cloudy, rainy }

class WeatherCard extends StatelessWidget {
  final String cityName;
  final double temperature;
  final WeatherCondition condition;
  final double humidity;

  const WeatherCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData weatherIcon;
    Color iconColor;
    switch (condition) {
      case WeatherCondition.sunny:
        weatherIcon = Icons.wb_sunny_rounded;
        iconColor = Colors.orange;
        break;
      case WeatherCondition.cloudy:
        weatherIcon = Icons.cloud_rounded;
        iconColor = Colors.blueGrey;
        break;
      case WeatherCondition.rainy:
        weatherIcon = Icons.umbrella_rounded;
        iconColor = Colors.blue;
        break;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        side: BorderSide(color: theme.colorScheme.outlineVariant, width: 1),
      ),
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${temperature.toStringAsFixed(1)}°C',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Icon(weatherIcon, size: 48, color: iconColor),
              ],
            ),
            const SizedBox(height: 16),
            Divider(color: theme.colorScheme.outlineVariant, height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 20,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Humidity:',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                Text(
                  '${humidity.toStringAsFixed(0)}%',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
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
