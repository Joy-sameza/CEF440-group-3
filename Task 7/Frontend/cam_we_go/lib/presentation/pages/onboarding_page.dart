import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.introductionImage),
            const SizedBox(height: 60),
            const Heading(
              title: 'Tracking Real time Location\nSafe Driving Practice',
              alignment: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Button(
              context: context,
              label: 'Get Started',
              onTap: () => context.go('/home'),
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
}
