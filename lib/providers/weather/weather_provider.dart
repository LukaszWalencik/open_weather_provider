import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:open_weather_provider/model/custom_error.dart';
import 'package:open_weather_provider/model/weather.dart';
import 'package:open_weather_provider/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherProvider extends StateNotifier<WeatherState> with LocatorMixin {
  WeatherProvider() : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    state = state.copyWith(status: WeatherStatus.loading);
    print('State: $state');

    try {
      final Weather weather =
          await read<WeatherRepository>().fetchWeather(city);
      state = state.copyWith(status: WeatherStatus.success, weather: weather);
      print('State: $state');
    } catch (e) {
      state = state.copyWith(
          status: WeatherStatus.error,
          error: CustomError(errorMsg: e.toString()));
      print('State: $state');
    }
  }
}
