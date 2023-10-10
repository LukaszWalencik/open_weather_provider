import 'package:flutter/material.dart';

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
          trailing: Switch(value: true, onChanged: (_) {}),
        ),
      ),
    );
  }
}
