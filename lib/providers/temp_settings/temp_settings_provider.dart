import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'temp_settings_state.dart';

class TempSettingsProvider with ChangeNotifier {
  TempSettingsState _state = TempSettingsState.initial();
  TempSettingsState get state => _state;

  void toggleTempUnit() {
    _state = _state.copyWith(
        unit: _state.unit == TempUnit.celcius
            ? TempUnit.fahrenheit
            : TempUnit.celcius);
    print(_state.unit);
    notifyListeners();
  }
}
