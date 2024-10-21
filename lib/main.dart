import 'package:flutter/material.dart';
import './form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Main(title: 'Flutter Demo Home Page'),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: MyForm()),
    );
  }
}
