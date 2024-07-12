import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreRouteDetails extends StatelessWidget {
  const MoreRouteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> destinations =
        GoRouterState.of(context).extra as Map<String, String>;
    return Scaffold(
      body: Center(child: Text(destinations.toString())),
    );
  }
}
