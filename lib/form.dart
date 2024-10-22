import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _result = 0; // Untuk menyimpan hasil perhitungan

  @override
  void initState() {
    super.initState();

    // Tambahkan listener pada kedua controller
    _controller1.addListener(_updateResult);
    _controller2.addListener(_updateResult);
  }

  // Fungsi untuk meperbarui hasil ketika ada perubahan pada form
  void _updateResult() {
    setState(() {
      double num1 = double.tryParse(_controller1.text) ?? 0;
      double num2 = (double.tryParse(_controller2.text) ?? 0) * 60;

      // Update hasil perhitungan setiap ada perubahan
      _result = num1 * num2;
    });
  }

  @override
  void dispose() {
    // Hapus listener untuk menghindari memory leaks
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Knitting Machine Instant Efficiency',
          style: TextStyle(color: Color(0xFFEC4C01)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  // cursorColor: Colors.amber, uncomment untuk style text ketika fokus
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  controller: _controller1,
                  decoration: const InputDecoration(
                      labelText: 'RPM Mesin',
                      labelStyle: TextStyle(fontWeight: FontWeight.w400),
                      // ketika fokus
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFFEC4C01),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(37, 37, 37, 1))),
                      floatingLabelStyle: TextStyle(color: Color(0xFFEC4C01))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  // cursorColor: Colors.amber, uncomment untuk style text ketika fokus
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  controller: _controller2,
                  decoration: const InputDecoration(
                      labelText: 'Jam Kerja',
                      labelStyle: TextStyle(fontWeight: FontWeight.w400),
                      // ketika fokus
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFFEC4C01),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(37, 37, 37, 1))),
                      floatingLabelStyle: TextStyle(color: Color(0xFFEC4C01))),
                ),
              ),
              const SizedBox(height: 20),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${_result.toInt()}',
                    style: const TextStyle(
                        fontSize: 20, color: Color(0xFFEC4C01))),
                TextSpan(
                    text: ' counter',
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
