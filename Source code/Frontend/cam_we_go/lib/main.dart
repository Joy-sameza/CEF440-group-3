import 'package:flutter/material.dart';

import 'core/router.dart';
import 'core/theme/colors.dart';
import 'core/theme/theme.dart';

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
      title: 'Cam We-Go',
      theme: myTheme(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
