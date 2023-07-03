import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.battery_6_bar,
          color: Colors.white,
        ),
        FutureBuilder<AndroidBatteryInfo?>(
            future: BatteryInfoPlugin().androidBatteryInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '${snapshot.data?.batteryLevel} %',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
      ],
    );
  }
}
