import 'package:cam_we_go/presentation/widgets/maps.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeMap(),
    );
  }
}
