import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'loginForm');
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            Images.logo,
            width: 48.w,
            height: 10.5.h,
          ),
          // SizedBox(
          //   height: 4.3.h,
          // ),
          const Text("Enter your username and password"),
          // SizedBox(
          //   height: 5.4.h,
          // ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  InputField.text(
                    context: context,
                    label: "Username",
                    hintText: "",
                    type: InputType.text,
                  ),
                  // SizedBox(
                  //   height: 3.2.h,
                  // ),
                  InputField.text(
                    context: context,
                    label: "Password",
                    hintText: "",
                    type: InputType.password,
                  ),
                ],
              )),
          // SizedBox(
          //   height: 1.1.h,
          // ),
          TextButton(
            onPressed: () {
              context.push('/reset_password');
            },
            child: const Text("forgot password?"),
          ),
          // SizedBox(
          //   height: 7.2.h,
          // ),
          Button(
            context: context,
            label: "Login",
            size: const Size(143, 45),
            onTap: () async {
              print('Verify login details with the server');
              await Future.delayed(const Duration(seconds: 2));
              context.go('/home');
            },
          ),
          // SizedBox(
          //   height: 3.1.h,
          // ),
          const Text("Or login with"),
          // SizedBox(
          //   height: 5.3.h,
          // ),
          Button.icon(
            onTap: () async {
              print('Start google login');
              await Future.delayed(const Duration(seconds: 2));
              context.go('/home');
            },
            context: context,
            label: 'Google',
            icon: AppIcons.buildSVG(AppIcons.googleLogo),
            gap: Gap.narrow,
          ),
          // SizedBox(
          //   height: 6.9.h,
          // ),
          Row(
            children: [
              const Text("Don't have an account?"),
              Text(
                "register",
                style: context.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
