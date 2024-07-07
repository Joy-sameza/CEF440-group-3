import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../widgets/widgets.dart';
import '../../../../../core/extensions.dart';

class CustomizeNotif extends StatefulWidget {
  const CustomizeNotif({super.key});

  @override
  State<CustomizeNotif> createState() => _CustomizeNotifState();
}

class _CustomizeNotifState extends State<CustomizeNotif> {
  @override
  Widget build(BuildContext context) {
    bool? checkboxValue = false;
    bool popUpListTileSwitch = false;
    bool voiceListTileSwitch = true;

    return Scaffold(
      appBar: AppBar(title: const Text('Notification settings')),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
          const Heading(title: 'Username'),
          Column(
            children: [
              const Heading(title: 'Notifications'),
              SizedBox(height: 1.h),
              CheckboxListTile.adaptive(
                value: checkboxValue,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value;
                  });
                },
                title: const Text('Enable'),
              ),
              Divider(height: 1.h),
              const Heading(title: 'Notification Type'),
              SwitchListTile.adaptive(
                value: popUpListTileSwitch,
                onChanged: (value) {
                  setState(() {
                    popUpListTileSwitch = value;
                  });
                },
                title: const Text('Pop-up'),
              ),
              SwitchListTile.adaptive(
                value: popUpListTileSwitch,
                onChanged: (value) {
                  setState(() {
                    popUpListTileSwitch = value;
                  });
                },
                title: const Text('Voice'),
              ),
              Divider(height: 1.h),
              const Heading(title: 'My Alerts'),
              SizedBox(height: 1.h),
              Button.outlinedBorderWithIcon(
                onTap: () => context.push('/settings/my_preferences'),
                label: 'Select your favorite Alerts',
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
