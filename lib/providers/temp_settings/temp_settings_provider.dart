import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

part 'temp_settings_state.dart';

class TempSettingsProvider extends StateNotifier<TempSettingsState> {
  TempSettingsProvider() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    state = state.copyWith(
        unit: state.unit == TempUnit.celcius
            ? TempUnit.fahrenheit
            : TempUnit.celcius);
    print(state.unit);
  }
}
