import 'package:flutter/material.dart';

class RoadSignInfo extends StatelessWidget {
  const RoadSignInfo({super.key, required this.roadSignId});
  final String roadSignId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('RoadSignInfo of road sign with Id $roadSignId')),
    );
  }
}
