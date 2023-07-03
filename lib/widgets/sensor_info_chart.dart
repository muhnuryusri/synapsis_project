import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/chart.dart';

class SensorChart extends StatefulWidget {
  const SensorChart({super.key});

  @override
  State<StatefulWidget> createState() => _SensorChartState();
}

class _SensorChartState extends State<SensorChart> {
  final List<ChartValue> _accelerometerData = [];
  final List<ChartValue> _gyroscopeData = [];
  final List<ChartValue> _magnetometerData = [];

  @override
  void initState() {
    super.initState();
    _initAccelerometerData();
    _initGyroscopeData();
    _initMagnetometerData();
  }

  void _initAccelerometerData() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerData.add(ChartValue(_accelerometerData.length, event.x));
      });
    });
  }

  void _initGyroscopeData() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeData.add(ChartValue(_gyroscopeData.length, event.x));
      });
    });
  }

  void _initMagnetometerData() {
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _magnetometerData.add(ChartValue(_magnetometerData.length, event.x));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<ChartValue, int>(
                dataSource: _accelerometerData,
                xValueMapper: (ChartValue value, _) => value.index,
                yValueMapper: (ChartValue value, _) => value.value,
              ),
            ],
          ),
        ),
        Expanded(
          child: SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<ChartValue, int>(
                dataSource: _gyroscopeData,
                xValueMapper: (ChartValue value, _) => value.index,
                yValueMapper: (ChartValue value, _) => value.value,
              ),
            ],
          ),
        ),
        Expanded(
          child: SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<ChartValue, int>(
                dataSource: _magnetometerData,
                xValueMapper: (ChartValue value, _) => value.index,
                yValueMapper: (ChartValue value, _) => value.value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
