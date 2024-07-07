import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Login'),
              SizedBox(
                height: 2.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
