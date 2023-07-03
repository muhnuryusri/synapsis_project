import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DeviceSocInfo extends StatefulWidget {
  const DeviceSocInfo({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceSocInfoState();
}

class _DeviceSocInfoState extends State<DeviceSocInfo> {
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iosInfo;
  late String manufacturer = '';
  late String model = '';
  late String buildNumber = '';
  late String sdkInt = '';
  late String? versionCode = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        androidInfo = await deviceInfo.androidInfo;
        setState(() {
          manufacturer = androidInfo.manufacturer;
          model = androidInfo.model;
          buildNumber = androidInfo.version.release;
          sdkInt = androidInfo.version.sdkInt.toString();
          versionCode = androidInfo.version.securityPatch;
        });
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        iosInfo = await deviceInfo.iosInfo;
        setState(() {
          manufacturer = 'Apple';
          model = iosInfo.name;
          buildNumber = iosInfo.systemVersion;
          sdkInt = iosInfo.systemVersion;
          versionCode = iosInfo.identifierForVendor;
        });
      }
    } catch (e) {
      Logger('Error getting device info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Manufacturer: $manufacturer'),
        Text('Model: $model'),
        Text('Build Number: $buildNumber'),
        Text('SDK Version: $sdkInt'),
        Text('Version Code: $versionCode'),
      ],
    );
  }
}
