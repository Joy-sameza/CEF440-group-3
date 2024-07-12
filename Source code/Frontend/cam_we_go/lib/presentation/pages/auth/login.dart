import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/enum.dart';
import '../../widgets/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'loginForm');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(1.96.w).copyWith(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Images.logo,
                    width: 18.13.w,
                    height: 15.475.h,
                  ),
                  Positioned(
                    top: 12.h,
                    left: -3.5.w,
                    width: 58.87.w,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Enter your username and password",
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
              //
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputField.text(
                      context: context,
                      label: "Email Address",
                      hintText: "",
                      type: InputType.email,
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Password",
                      hintText: "",
                      type: InputType.password,
                      suffixIcon: const SuffixWidget(),
                      isFinal: true,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push('/reset_password'),
                  child: Text(
                    "forgot password?",
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Button(
                context: context,
                label: "Login",
                size: const Size(350, 45),
                onTap: () async {
                  print('Verify login details with the server');
                  await Future.delayed(const Duration(seconds: 2));
                  context.go('/home');
                },
              ),
              SizedBox(
                height: 1.1.h,
              ),
              const Text("Or login with"),
              SizedBox(
                height: 1.0.h,
              ),
              Button.outlinedBorderWithIcon(
                label: "Google",
                icon: Icon(
                  Icons.g_mobiledata,
                  color: context.primaryColor,
                  applyTextScaling: true,
                  weight: 50,
                ),
                size: const Size(350, 45),
                centered: true,
                onTap: () async {
                  print('Verify login details with the server');
                  await Future.delayed(const Duration(seconds: 2));
                  context.go('/home');
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pushReplacement('/register');
                      },
                      child: Text(
                        "Register",
                        style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.primaryColor),
                      ),
                    ),
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

class SuffixWidget extends StatefulWidget {
  const SuffixWidget({
    super.key,
  });

  @override
  State<SuffixWidget> createState() => _SuffixWidgetState();
}

class _SuffixWidgetState extends State<SuffixWidget> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggle,
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
    );
  }
}
