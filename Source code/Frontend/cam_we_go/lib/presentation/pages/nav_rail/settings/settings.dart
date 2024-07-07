import 'package:cam_we_go/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          const Column(
            children: [
              CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
              ),
              Heading(title: 'Username')
            ],
          ),
          Button.outlinedBorderWithIcon(
            onTap: () => context.push('/settings/edit_profile'),
            label: "Edit profile",
            icon: const Icon(Icons.edit),
          ),
          Button.outlinedBorderWithIcon(
            onTap: () => context.push('/settings/my_preferences'),
            label: "customize notification",
            icon: const Icon(Icons.notification_add_outlined),
          ),
          Button.outlinedBorderWithIcon(
            onTap: () => context.push('/settings/'),
            label: "Select language",
            icon: const Icon(Icons.language),
          ),
          Button.outlinedBorderWithIcon(
            onTap: () => context.push('/settings/report'),
            label: "Provide a report",
            icon: const Icon(Icons.report),
          ),
          Button.outlinedBorderWithIcon(
            onTap: () => context.push('/settings/post_crash_care'),
            label: "Post crash care info",
            icon: const Icon(Icons.car_crash_sharp),
          ),
          Button(
            context: context,
            label: 'Log out',
            size: ButtonSize.small,
            onTap: () {
              context.pushReplacement('/login');
            },
          ),
        ],
      ),
    );
  }
}
