import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:synapsis_project/widgets/custom_button.dart';

import '../color_constants.dart';

class SensorInfo extends StatefulWidget {
  const SensorInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateSensorInfo();
}

class _StateSensorInfo extends State<SensorInfo> {
  String accelerometerX = '';
  String accelerometerY = '';
  String accelerometerZ = '';

  String gyroscopeX = '';
  String gyroscopeY = '';
  String gyroscopeZ = '';

  String magnetometerX = '';
  String magnetometerY = '';
  String magnetometerZ = '';

  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        accelerometerX = '${event.x}';
        accelerometerY = '${event.y}';
        accelerometerZ = '${event.z}';
      });
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        gyroscopeX = '${event.x}';
        gyroscopeY = '${event.y}';
        gyroscopeZ = '${event.z}';
      });
    });

    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        magnetometerX = '${event.x}';
        magnetometerY = '${event.y}';
        magnetometerZ = '${event.z}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SensorWidget(
          sensor: 'Accelerometer',
          x: accelerometerX,
          y: accelerometerY,
          z: accelerometerZ,
        ),
        const SizedBox(height: 20),
        SensorWidget(
          sensor: 'Gyroscope',
          x: gyroscopeX,
          y: gyroscopeY,
          z: gyroscopeZ,
        ),
        const SizedBox(height: 20),
        SensorWidget(
          sensor: 'Magnetometer',
          x: magnetometerX,
          y: magnetometerY,
          z: magnetometerZ,
        ),
      ],
    );
  }
}

class SensorWidget extends StatelessWidget {
  final String sensor;
  final String x;
  final String y;
  final String z;

  const SensorWidget(
      {super.key,
      required this.x,
      required this.y,
      required this.z,
      required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          sensor,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorConstants.primaryFontColor,
          ),
        ),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(
            color: ColorConstants.strokeColor,
            borderRadius: BorderRadius.circular(5),
          ),
          children: [
            TableRow(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('x'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(x),
              ),
            ]),
            TableRow(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text('y'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(y),
              ),
            ]),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('z'),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(z),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        CustomButton(
          color: ColorConstants.mainColor,
          text: 'Hardware Info',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('Sensor hardware info'),
                content: null,
              ),
            );
          },
        ),
      ],
    );
  }
}
