import 'package:open_weather_provider/exceptions/weatcher_exception.dart';
import 'package:open_weather_provider/model/custom_error.dart';
import 'package:open_weather_provider/model/direct_geocoding.dart';
import 'package:open_weather_provider/model/weather.dart';
import 'package:open_weather_provider/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;

  WeatherRepository({required this.weatherApiServices});
  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiServices.getDirectGeocoding(city);
      print('Direct Geocoding: $directGeocoding');
      final Weather tempWeather =
          await weatherApiServices.getWeather(directGeocoding);
      print('Temporary weather: $tempWeather');
      final Weather weather = tempWeather.copyWith(
          name: directGeocoding.name, country: directGeocoding.country);
      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errorMsg: e.message);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }
}
