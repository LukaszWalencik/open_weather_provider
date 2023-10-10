import 'package:flutter/material.dart';
import 'package:open_weather_provider/providers/providers.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text('Temperature Unit'),
          subtitle: Text('Celcius/Fahrenheit'),
          trailing: Switch(
              value: context.watch<TempSettingsProvider>().state.unit ==
                  TempUnit.celcius,
              onChanged: (_) {
                context.read<TempSettingsProvider>().toggleTempUnit();
              }),
        ),
      ),
    );
  }
}
