import 'package:flutter/material.dart';
import 'package:smart_fluid_flashlight_plugin/smart_fluid_flashlight_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLightOn = false;

  void _toggleFlashlight() async {
    // Викликаємо наш статичний метод
    final isOn = await SmartFluidFlashlightPlugin.toggleLight();
    setState(() {
      _isLightOn = isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flashlight Plugin Test')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isLightOn ? Icons.flashlight_on : Icons.flashlight_off,
                size: 100,
                color: _isLightOn ? Colors.yellow : Colors.grey,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleFlashlight,
                child: Text(_isLightOn ? 'TURN OFF' : 'TURN ON'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
