import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kme_project_test/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: Duration(milliseconds: 3200),
        splashScreenBody: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300),
                  Text(
                    'KMIE',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC4C01),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Knitting Machine Instant Efficiency',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(83, 83, 83, 1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0), // Jarak dari bawah layar
                child: Text(
                  'by yudan maulana',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        nextScreen: LoginPage(),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome to the Home Screen')),
    );
  }
}
