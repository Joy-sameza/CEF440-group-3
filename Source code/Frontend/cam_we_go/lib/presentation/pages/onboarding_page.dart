import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.introductionImage),
              SizedBox(height: 4.h),
              Column(
                children: [
                  const Heading(
                    title: 'Tracking Real time Location\nSafe Driving Practice',
                    alignment: TextAlign.center,
                  ),
                  SizedBox(height: 3.h),
                  Button(
                    context: context,
                    label: 'Get Started',
                    onTap: () => context.pushReplacement('/login'),
                    size: ButtonSize.medium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
