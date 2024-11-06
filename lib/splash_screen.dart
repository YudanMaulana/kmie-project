// splash_screen.dart

import 'package:flutter/material.dart';
import 'package:kme_project_test/login.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      gifPath: 'assets/furina.gif',
      gifWidth: 269,
      gifHeight: 474,
      nextScreen: const LoginPage(),
      duration: const Duration(milliseconds: 3500),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}
