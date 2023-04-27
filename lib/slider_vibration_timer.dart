import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';


class VibrationSliderScreenTimer extends StatefulWidget {
  @override
  _VibrationSliderScreenStateTimer createState() => _VibrationSliderScreenStateTimer();
}

class _VibrationSliderScreenStateTimer extends State<VibrationSliderScreenTimer> {
  double _time = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vibration Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Vibration duration: ${_time.toInt()} ms'),
          Slider(
            value: _time,
            min: 0.0,
            max: 255.0,
            divisions: 255,
            onChanged: (value) {
              setState(() {
                _time = value;
              });
            },
          ),
          SizedBox(height: 20),
          VibrationButtonTimer(time: _time),
        ],
      ),
    );
  }
}

// Classe que lida com a vibração do dispositivo
class VibrationButtonTimer extends StatelessWidget {
  final double time;

  VibrationButtonTimer({required this.time});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        VibrationServiceTimer.vibrate(duration: time.toInt());
      },
      child: Text('Vibrate'),
    );
  }
}

// Classe que lida com a vibração do dispositivo
class VibrationServiceTimer {
  static void vibrate({required int duration}) {
    Vibration.vibrate(duration: duration);
  }
}