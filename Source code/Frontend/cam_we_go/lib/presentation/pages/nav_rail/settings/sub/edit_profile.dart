import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constant.dart';
import 'package:cam_we_go/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/enum.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> formkey = GlobalKey(debugLabel: 'editProfileForm');

  String? userName, password, email, mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(title: "Edit Profile"),
        backgroundColor: context.surfaceColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 10.w,
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.black.withOpacity(0.8),
                          size: 20.w,
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 5.w,
                            height: 5.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.primaryColor,
                            ),
                            child: const Icon(Icons.camera_alt, size: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  const Heading(title: 'Username')
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InputField.text(
                      context: context,
                      label: "Name",
                      hintText: "",
                      type: InputType.text,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Email Address",
                      hintText: "",
                      type: InputType.email,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    InputField.text(
                      context: context,
                      label: "Mobile Number",
                      hintText: "",
                      type: InputType.phone,
                    ),
                    SizedBox(
                      height: 1.5.h,
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
                      isFinal: true,
                    ),
                    SizedBox(height: 2.2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button.outlinedBorder(
                          label: 'Cancel',
                          size: ButtonSize.small,
                          color: context.primaryColor,
                          onTap: () {
                            formkey.currentState!.reset();
                            context.pop();
                          },
                        ),
                        Button(
                          context: context,
                          label: 'Save',
                          size: ButtonSize.small,
                          onTap: () {
                            if (!formkey.currentState!.validate()) return;
                            formkey.currentState!.save();
                            context.pop();
                          },
                        ),
                      ],
                    )
                  ],
                ),
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
