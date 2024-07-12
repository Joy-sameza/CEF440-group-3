import 'package:flutter/material.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/enum.dart';
import '../../widgets/widgets.dart';
import '../../../core/extensions.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey(debugLabel: 'Register');
    String? password;
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
                    left: -1.1.w,
                    width: 58.87.w,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Enter your details to Register",
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
                      label: "Name",
                      hintText: "",
                      type: InputType.text,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Email Address",
                      hintText: "",
                      type: InputType.email,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Mobile Number",
                      hintText: "",
                      type: InputType.phone,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Password",
                      hintText: "",
                      type: InputType.password,
                      suffixIcon: const SuffixWidget(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a password';
                        }
                        if (!(value.length >= 8 && value.length <= 12)) {
                          return 'Password should be between 8 and 12 characters';
                        } else if (value.length >= 8 && value.length <= 12) {
                          password = value;
                          return null;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Confirm Password",
                      hintText: "",
                      type: InputType.password,
                      suffixIcon: const SuffixWidget(),
                      validator: (value) {
                        if (value != password) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      isFinal: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Button(
                context: context,
                label: "Signup",
                size: const Size(350, 45),
                onTap: () async {
                  if (!formKey.currentState!.validate()) return;
                  formKey.currentState!.save();
                  context.go('/home');
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pushReplacement('/login');
                      },
                      child: Text(
                        "Login",
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
