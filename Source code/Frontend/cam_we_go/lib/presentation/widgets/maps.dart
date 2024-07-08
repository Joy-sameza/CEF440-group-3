import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key, required this.from, required this.to});

  final String from, to;

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _bueaLocation = CameraPosition(
    target: LatLng(4.2028, 9.2616),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _bueaLocation,
        myLocationEnabled: true,
        trafficEnabled: true,
        buildingsEnabled: false,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
