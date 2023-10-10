// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'temp_settings_provider.dart';

enum TempUnit { celcius, fahrenheit }

class TempSettingsState extends Equatable {
  final TempUnit unit;
  TempSettingsState({
    this.unit = TempUnit.celcius,
  });
  factory TempSettingsState.initial() {
    return TempSettingsState();
  }

  @override
  List<Object> get props => [unit];

  @override
  bool get stringify => true;

  TempSettingsState copyWith({
    TempUnit? unit,
  }) {
    return TempSettingsState(
      unit: unit ?? this.unit,
    );
  }
}
