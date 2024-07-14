import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class GetViewLocation {
  const GetViewLocation();

  Future<Position?> get currentLocation async => await _verifyAndGetCurrentLocation();

  Future<Position?> get getLastKnownPosition async => await _verifyAndGetLastKnownPosition();

  Future<Position?> _verifyAndGetCurrentLocation() async {
    if (!await _verifyPermissionAndAccess()) {
      return Future.error('Could not get current location');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<Position?> _verifyAndGetLastKnownPosition() async {
    if (!await _verifyPermissionAndAccess()) {
      return Future.error('Could not get last known location');
    }
    return await Geolocator.getLastKnownPosition();
  }

  Future<bool> _verifyPermissionAndAccess() async {

    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Location().requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    PermissionStatus permissionGranted = await Location().hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Location().requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return serviceEnabled && permissionGranted == PermissionStatus.granted;
  }
}
