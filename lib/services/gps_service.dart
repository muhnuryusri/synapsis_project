import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class GpsService {
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late StreamSubscription<Position> positionStreamSubscription;
  late Position position;
  String long = "";
  String lat = "";

  Future<void> checkGps() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(msg: 'Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          Fluttertoast.showToast(
              msg: 'Location permissions are permanently denied');
        } else {
          hasPermission = true;
        }
      } else {
        hasPermission = true;
      }

      if (hasPermission) {
        await getLocation();
      }
    } else {
      Fluttertoast.showToast(
          msg: "GPS Service is not enabled, turn on GPS location");
    }
  }

  Future getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    long = position.longitude.toString();
    lat = position.latitude.toString();
  }

  Stream<Position> getPositionStream() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  void dispose() {
    positionStreamSubscription.cancel();
  }
}
