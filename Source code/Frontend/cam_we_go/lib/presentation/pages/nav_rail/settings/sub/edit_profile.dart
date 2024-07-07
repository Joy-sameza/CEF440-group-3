import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constants.dart';
import 'package:cam_we_go/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

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
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputField.text(
                context: context,
                label: "Username",
                hintText: "",
                onSaved: (value) {
                  userName = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a user name';
                  }
                  if (value.length < 3) {
                    return 'User name should be atleast 3 characters';
                  }
                  return null;
                },
                type: InputType.text,
              ),
              InputField.text(
                context: context,
                label: "Password",
                hintText: "",
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password should be atleast 6 characters';
                  }
                  return null;
                },
                type: InputType.password,
              ),
              InputField.text(
                context: context,
                label: "Email address",
                hintText: "",
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter an email address';
                  }
                  final RegExp regexp = RegExp(r'^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
                  if (regexp.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                type: InputType.email,
              ),
              InputField.text(
                context: context,
                label: "Mobile Number",
                hintText: "",
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a phone number';
                  }
                  final RegExp regexp = RegExp(r'^[62](3|[5-9])\d{7}$');
                  if (regexp.hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
                type: InputType.phone,
                isFinal: true,
              ),
              SizedBox(height: 0.2.h),
              Row(
                children: [
                  Button(
                    context: context,
                    label: 'Cancel',
                    size: ButtonSize.small,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Button(
                    context: context,
                    label: 'Save',
                    size: ButtonSize.small,
                    onTap: () {
                      context.pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
