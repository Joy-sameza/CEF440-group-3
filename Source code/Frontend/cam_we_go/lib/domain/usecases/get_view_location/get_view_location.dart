import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class GetViewLocation {
  const GetViewLocation();

  // LocationData? currentLocation;
  Future<Position?> get currentLocation async {
    return await _verifyAndGetCurrentLocation();
  }

  Future<Position?> get getLastKnownPosition async {
    return await Geolocator.getLastKnownPosition();
  }

  Future<Position?> _verifyAndGetCurrentLocation() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Location().requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    PermissionStatus permissionGranted = await Location().hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Location().requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await Geolocator.getCurrentPosition();
  }
}
