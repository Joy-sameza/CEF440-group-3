import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, String> destinations = GoRouterState.of(context).extra as Map<String, String>;



    return Scaffold(
      body: Center(
        child: Text(
          'From: ${destinations["from"]}}\nTo: {{destinations["to"]}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
