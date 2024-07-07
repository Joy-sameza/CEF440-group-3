import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/widgets.dart';
import '../../../core/extensions.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Images.logo),
          SizedBox(
            height: 2.h,
          ),
          const Text("Enter your details to register"),
          SizedBox(
            height: 3.8.h,
          ),
          Form(
              child: Column(
            children: [
              InputField.text(
                context: context,
                label: "Username",
                hintText: "",
                type: InputType.text,
              ),
              SizedBox(
                height: 3.2.h,
              ),
              InputField.text(
                context: context,
                label: "Email Address",
                hintText: "",
                type: InputType.text,
              ),
              SizedBox(
                height: 3.2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.primaryContainer,
                        width: 1.0,
                      ),
                      // border: BoxBorde/r
                    ),
                    child: Row(
                      children: [AppIcons.buildSVG(AppIcons.cameroonFlag),
                        const Text("237"),
                      ],
                    ),
                  ),
                  // Button(
                  //   context: context,
                  //   label: "",
                  //   size: const Size(143, 45),
                  //   onTap: () => _onTap(context),
                  // ),
                  InputField.text(
                    context: context,
                    label: "Mobile Number",
                    hintText: "",
                    type: InputType.phone,
                  ),
                ],
              ),
              InputField.text(
                context: context,
                label: "Password",
                hintText: "",
                type: InputType.text,
              ),
              SizedBox(
                height: 3.2.h,
              ),
              InputField.text(
                context: context,
                label: "Confirm Password",
                hintText: "",
                type: InputType.text,
              ),
              Button(
                context: context,
                label: "Signup",
                size: const Size(143, 45),
                onTap: () async {
                  print('Verify login details with the server');
                  await Future.delayed(const Duration(seconds: 2));
                  context.go('/home');
                },
              ),
              SizedBox(
                height: 3.2.h,
              ),
              Row(children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text("Login"),
                ),
                Text(
                  "register",
                  style: context.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ])
            ],
          ))
        ],
      ),
    );
  }
}
