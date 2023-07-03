import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../color_constants.dart';
import '../services/gps_service.dart';

class GpsStatus extends StatefulWidget {
  const GpsStatus({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GpsStatusState();
}

class _GpsStatusState extends State<GpsStatus> {
  GpsService gpsService = GpsService();
  StreamSubscription<Position>? positionStreamSubscription;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    gpsService.checkGps();
    positionStreamSubscription =
        gpsService.getPositionStream().listen((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    });
  }

  @override
  void dispose() {
    positionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorConstants.containerColor,
        border: Border.all(width: 1, color: ColorConstants.strokeColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.location_pin,
            color: ColorConstants.mainColor,
          ),
          const SizedBox(width: 10),
          Text(
            'Lat: ${latitude ?? ''}, Long: ${longitude ?? ''} ',
            style: TextStyle(
              color: ColorConstants.primaryFontColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}
