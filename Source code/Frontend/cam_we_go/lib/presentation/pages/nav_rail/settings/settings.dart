import 'package:cam_we_go/core/extensions.dart';
import 'package:cam_we_go/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: context.textTheme.headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
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
              Button.outlinedBorderWithIcon(
                onTap: () => context.push('/settings/edit_profile'),
                label: "Edit profile",
                icon: const Icon(Icons.edit),
                size: ButtonSize.large,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Button.outlinedBorderWithIcon(
                onTap: () => context.push('/settings/my_preferences'),
                label: "customize notification",
                icon: const Icon(Icons.notification_add_outlined),
                size: ButtonSize.large,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const LanguageSelector(),
              SizedBox(
                height: 1.5.h,
              ),
              Button.outlinedBorderWithIcon(
                onTap: () => context.push('/settings/report'),
                label: "Provide a report",
                icon: const Icon(Icons.report),
                size: ButtonSize.large,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Button.outlinedBorderWithIcon(
                onTap: () => context.push('/settings/post_crash_care'),
                label: "Post crash care info",
                icon: const Icon(Icons.car_crash_sharp),
                size: ButtonSize.large,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Button(
                context: context,
                label: 'Log out',
                size: ButtonSize.medium,
                onTap: () {
                  context.pushReplacement('/login');
                },
              ),
              SizedBox(height: 0.5.h),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.outlinedBorderWithIcon(
      onTap: () => _openLanguageDialog(context),
      label: "Select language",
      icon: const Icon(Icons.language),
      size: ButtonSize.large,
    );
  }

  Future<bool?> _openLanguageDialog(BuildContext context) {
    bool? isEnglish = true;

    return showAdaptiveDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Language dialog',
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Center(child: Heading(title: 'Select language')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    indent: 10.w,
                    endIndent: 10.w,
                    color: Colors.grey,
                  ),
                  RadioListTile(
                    title: const Text('English'),
                    value: true,
                    groupValue: isEnglish,
                    onChanged: (value) {
                      setState(() {
                        isEnglish = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('French'),
                    value: false,
                    groupValue: isEnglish,
                    onChanged: (value) {
                      setState(() {
                        isEnglish = value!;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
