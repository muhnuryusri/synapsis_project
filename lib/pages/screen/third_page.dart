import 'package:flutter/material.dart';
import 'package:synapsis_project/widgets/sensor_info_chart.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<StatefulWidget> createState() => _StateThirdPage();
}

class _StateThirdPage extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SensorChart(),
        ),
      ),
    );
  }
}
