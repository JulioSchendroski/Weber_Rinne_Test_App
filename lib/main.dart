import 'package:flutter/material.dart';
import 'slider_vibration_amplitude.dart';
import 'slider_vibration_timer.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vibration Demo',
      home: Column(
        children: [
          VibrationSliderScreenTimer(),
          VibrationSliderScreenAmplitude(),
        ],
      ),
    );
  }
}