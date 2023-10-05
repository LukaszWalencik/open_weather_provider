// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double TempMax;
  final String name;
  final String country;
  final DateTime lastUpdated;
  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.TempMax,
    required this.name,
    required this.country,
    required this.lastUpdated,
  });

  factory Weather.initial() {
    return Weather(
        description: '',
        icon: '',
        temp: 100,
        tempMin: 100,
        TempMax: 100,
        name: '',
        country: '',
        lastUpdated: DateTime(1970));
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
        description: weather['description'],
        icon: weather['icon'],
        temp: main['temp'],
        tempMin: main['temp_min'],
        TempMax: main['temp_max'],
        name: '',
        country: '',
        lastUpdated: DateTime.now());
  }

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMin,
      TempMax,
      name,
      country,
      lastUpdated,
    ];
  }

  @override
  bool get stringify => true;

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? TempMax,
    String? name,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      TempMax: TempMax ?? this.TempMax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
