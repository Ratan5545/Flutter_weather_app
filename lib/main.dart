import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.lightBlue[50], // Light background color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  String? selectedCity;
  String weatherCondition = '';
  String temperature = '';

  // Mock data for weather conditions
  final Map<String, Map<String, String>> mockWeatherData = {
    'New York': {'condition': 'Sunny', 'temperature': '25°C'},
    'Los Angeles': {'condition': 'Cloudy', 'temperature': '22°C'},
    'Chicago': {'condition': 'Rainy', 'temperature': '18°C'},
    'Houston': {'condition': 'Sunny', 'temperature': '30°C'},
  };

  void updateWeather(String? city) {
    if (city != null) {
      setState(() {
        selectedCity = city;
        weatherCondition = mockWeatherData[city]!['condition']!;
        temperature = mockWeatherData[city]!['temperature']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Select a city'),
              value: selectedCity,
              onChanged: updateWeather,
              items: mockWeatherData.keys.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              dropdownColor: Colors.white, // Dropdown background color
            ),
            const SizedBox(height: 20),
            if (selectedCity != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Weather in $selectedCity',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Condition: $weatherCondition',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    Text(
                      'Temperature: $temperature',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
