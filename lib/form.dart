import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _result = 0; // Untuk menyimpan hasil penjumlahan
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      double num1 = double.tryParse(_controller1.text) ?? 0;
      double num2 = (double.tryParse(_controller2.text) ?? 0) * 60;

      // Menjumlahkan kedua form ygy
      _result = num1 * num2;
      int intResult = _result.toInt();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titleTextStyle: const TextStyle(color: Color(0xFFEC4C01)),
            title: const Text('Hasil Efisiensi overall'),
            content: Text('$intResult counter'),
          );
        },
      );
    }
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
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(signed: true),
                controller: _controller1,
                decoration: const InputDecoration(labelText: 'RPM Mesin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nilai';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(signed: true),
                controller: _controller2,
                decoration: const InputDecoration(
                    labelText: 'Jam Kerja', labelStyle: TextStyle()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nilai';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Jumlahkan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
