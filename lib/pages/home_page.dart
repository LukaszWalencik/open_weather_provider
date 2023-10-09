import 'package:flutter/material.dart';
import 'package:open_weather_provider/pages/search_page.dart';
import 'package:open_weather_provider/providers/providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
              onPressed: () async {
                _city = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
                print('City: $_city');
                if (_city != null) {
                  context.read<WeatherProvider>().fetchWeather(_city!);
                }
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
