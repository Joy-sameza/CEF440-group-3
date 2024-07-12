import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geocoder {
  Future<String> getAddress(double latitude, double longitude) async {
    
    return 'address';
  }

  Future<LatLng> getLatLng(String address) async {
    return const LatLng(0, 0);
  }
}