import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> destinations = GoRouterState.of(context).extra as Map<String, String>;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Placeholder(),
            Container(
              height: 5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.primaryColor,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, -4),
                    blurRadius: 4,
                    color: Colors.black26,
                  ),
                ],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
