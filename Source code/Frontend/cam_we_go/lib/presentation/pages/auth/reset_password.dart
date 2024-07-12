import 'package:flutter/material.dart';

import '../../../core/utils/constant.dart';
import '../../widgets/widgets.dart';
import '../../../core/extensions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Images.logo,
            width: 48.w,
            height: 10.5.h,
          ),
          SizedBox(
            height: 2.h,
          ),
          const Heading(
            title: 'Reset Password',
          ),
          SizedBox(
            height: 11.4.h,
          ),
          Text(
            'Thank you!\n\nPlease check your email for further instructions',
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.6.h,
          ),
          Row(
            children: [
              const Text("Email expires in"),
              Text(
                "05:00",
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('minutes'),
            ],
          ),
          SizedBox(
            height: 2.4.h,
          ),
          const Text("Didn't get the reset email?"),
          SizedBox(
            height: 5.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                context: context,
                label: "Resend",
                size: const Size(143, 45),
                onTap: () => _onTap(context),
              ),
              Button(
                context: context,
                label: "Cancel",
                size: const Size(143, 45),
                onTap: () => _onTap(context),
              ),
            ],
          ),
          SizedBox(
            height: 13.7.h,
          ),
          Row(children: [
            const Text("Need help?"),
            Text(
              "Contact Support Team",
              style: context.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    );
  }

  _onTap(BuildContext context) {
    // context.go
  }
}
