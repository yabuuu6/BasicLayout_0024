import 'package:flutter/material.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 155, 228),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Yogyakarta",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Today",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              "28°C",
              style: TextStyle(fontSize: 80, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            const Text(
              "Sunny",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.ac_unit, color: Colors.blue),
                Text(
                  "5 km/h",
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 107, 144, 155)),
                ),
                SizedBox(width: 5),
                
              ],
            ),
            const SizedBox(height: 20),
            WeatherForecast(),
            const SizedBox(height: 20),
            const Text(
              "Developed by: YabuuuTI.id",
              style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 85, 85, 85)),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> forecastData = [
      {"time": "Now", "temp": "28°C", "wind": "10 km/h"},
      {"time": "17.00", "temp": "28°C", "wind": "10 km/h"},
      {"time": "20.00", "temp": "28°C", "wind": "10 km/h"},
      {"time": "23.00", "temp": "28°C", "wind": "10 km/h"},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Next 10 days",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: forecastData
                  .map((data) => WeatherColumn(
                        time: data["time"],
                        temp: data["temp"],
                        windSpeed: data["wind"],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherColumn extends StatelessWidget {
  final String time;
  final String temp;
  final String windSpeed;

  const WeatherColumn({
    super.key,
    required this.time,
    required this.temp,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Icon(Icons.ac_unit, color: Colors.blue, size: 30),
        const SizedBox(height: 5),
        Text(temp, style: const TextStyle(fontSize: 18, color: Colors.blue)),
        const SizedBox(height: 5),
        const Icon(Icons.air, color: Color.fromARGB(255, 51, 67, 68)),
        Text(windSpeed, style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 51, 67, 68))),
        const SizedBox(height: 5),
        const Icon(Icons.arrow_downward, color: Color.fromARGB(255, 248, 30, 30)),
        const Text("0%", style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 248, 30, 30))),
      ],
    );
  }
}