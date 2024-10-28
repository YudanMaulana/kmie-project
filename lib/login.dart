import 'package:flutter/material.dart';
import 'form.dart';
import 'package:kme_project_test/pw.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showQRCode = false;

  void _login() {
    // Pengecekan login dan variable username dan password kami sembunyikan
    if (_usernameController.text == username &&
        _passwordController.text == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyForm()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Gagal"),
          content: const Text(
              "Username atau password salah, silahkan pindai kode QR untuk mengubungi developer"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      setState(() {
        _showQRCode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: const TextSpan(children: [
        TextSpan(
            text: "Log",
            style: TextStyle(color: Color(0xFFEC4C01), fontSize: 20)),
        TextSpan(
            text: "in",
            style:
                TextStyle(color: Color.fromRGBO(83, 83, 83, 1), fontSize: 20))
      ]))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Color(0xFFEC4C01)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEC4C01)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(83, 83, 83, 1)),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Color(0xFFEC4C01)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFEC4C01)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(83, 83, 83, 1)),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text(
                "Login",
                style: TextStyle(color: Color(0xFFEC4C01)),
              ),
            ),
            const SizedBox(height: 20.0),
            // if true show QR
            if (_showQRCode)
              Column(
                children: [
                  Image.asset(
                    'assets/icon/qr_wame.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    "Screenshot dan gunakan Google Lens untuk memindai.",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(83, 83, 83, 1)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
