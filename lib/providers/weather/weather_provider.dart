import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_provider/model/custom_error.dart';
import 'package:open_weather_provider/model/weather.dart';
import 'package:open_weather_provider/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherProvider with ChangeNotifier {
  WeatherState _state = WeatherState.initial();

  WeatherProvider({required this.weatherRepository});
  WeatherState get state => _state;

  final WeatherRepository weatherRepository;

  Future<void> fetchWeather(String city) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    print('State: $_state');
    notifyListeners();

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);
      _state = _state.copyWith(status: WeatherStatus.success, weather: weather);
      print('State: $_state');
    } catch (e) {
      _state = _state.copyWith(
          status: WeatherStatus.error,
          error: CustomError(errorMsg: e.toString()));
      print('State: $_state');
    }
  }
}
