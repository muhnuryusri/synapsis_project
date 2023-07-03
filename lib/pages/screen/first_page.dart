import 'package:flutter/material.dart';
import 'package:synapsis_project/color_constants.dart';
import 'package:synapsis_project/widgets/battery_status.dart';
import 'package:synapsis_project/widgets/custom_clock.dart';
import 'package:synapsis_project/widgets/gps_status.dart';
import 'package:synapsis_project/widgets/sensor_info.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorConstants.mainColor),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo,',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomClock(),
                        ],
                      ),
                      BatteryStatus(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const GpsStatus(),
                const SizedBox(height: 30),
                Text(
                  'Sensors Info',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.primaryFontColor,
                  ),
                ),
                const SensorInfo()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mainColor,
        onPressed: () {
          Navigator.pushNamed(context, 'second_page');
        },
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
