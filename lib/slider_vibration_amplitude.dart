import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';


class VibrationSliderScreenAmplitude extends StatefulWidget {
  @override
  _VibrationSliderScreenStateAmplitude createState() => _VibrationSliderScreenStateAmplitude();
}

class _VibrationSliderScreenStateAmplitude extends State<VibrationSliderScreenAmplitude> {
  double _hertz = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vibration Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Vibration amplitude: ${_hertz.toInt()} hertz'),
          Slider(
            value: _hertz,
            min: 0.0,
            max: 255.0,
            divisions: 255,
            onChanged: (value) {
              setState(() {
                _hertz = value;
              });
            },
          ),
          SizedBox(height: 20),
          VibrationButtonAmplitude(hertz: _hertz),
        ],
      ),
    );
  }
}

class VibrationButtonAmplitude extends StatelessWidget {
  final double hertz;

  VibrationButtonAmplitude({required this.hertz});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        VibrationServiceAmplitude.vibrate(amplitude: hertz.toInt());
      },
      child: Text('Vibrate'),
    );
  }
}

class VibrationServiceAmplitude {
  static void vibrate({required int amplitude}) {
    Vibration.vibrate(amplitude: amplitude);
  }
}