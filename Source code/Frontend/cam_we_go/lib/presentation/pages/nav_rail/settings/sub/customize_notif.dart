import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import '../../../../widgets/widgets.dart';

class CustomizeNotif extends StatelessWidget {
  const CustomizeNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification settings')),
      body: const Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
          Heading(title: 'Username'),
          Column(
            children: [
              Heading(title: 'Notifications'),
            ],
          )
        ],
      ),
    );
  }
}
