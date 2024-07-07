import 'package:cam_we_go/core/router.dart';
import 'package:cam_we_go/core/theme/colors.dart';
import 'package:cam_we_go/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CamWeGo());
}

class CamWeGo extends StatelessWidget {

  const CamWeGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      color: createMaterialColor(normal),
      debugShowCheckedModeBanner: false,
      title: 'CAM WE-GO',
      theme: myTheme(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
