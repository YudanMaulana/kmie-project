import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kme_project_test/login.dart';
import 'package:kme_project_test/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KMIE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginPage()),
    );
  }
}
