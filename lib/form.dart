import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  double _countermurni = 0;
  double _lostcounter = 0;
  double _percentlost = 0;
  double _percentincome = 0;
  double _counterincome = 0;
  bool _isFormFilled = false;

  @override
  void initState() {
    super.initState();
    _controller1.addListener(_checkFormFilled);
    _controller2.addListener(_checkFormFilled);
    _controller3.addListener(_checkFormFilled);
  }

  void _checkFormFilled() {
    setState(() {
      _isFormFilled = _controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty;
    });
  }

  void _calculateLostCounter() {
    if (!_isFormFilled) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Perhatian"),
          content: Text("Semua field harus diisi"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = (double.tryParse(_controller2.text) ?? 0) * 60;
    double num3 = double.tryParse(_controller3.text) ?? 0;

    setState(() {
      _countermurni = num1 * num2;
      _lostcounter = _countermurni - num3;
      _counterincome = num3;
      _percentlost = (_lostcounter / _countermurni) * 100;
      _percentlost = double.parse(_percentlost.toStringAsFixed(2));
      _percentincome = ((_countermurni - _lostcounter) / _countermurni) * 100;
      _percentincome = double.parse(_percentincome.toStringAsFixed(4));
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(TextSpan(children: [
          TextSpan(
              text: "Knitting Machine ",
              style: TextStyle(color: Color.fromRGBO(83, 83, 83, 1))),
          TextSpan(
              text: "Instant Efficiency ",
              style: TextStyle(color: Color(0xFFEC4C01))),
        ])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              _buildTextField('RPM Mesin', _controller1),
              _buildTextField('Jam Kerja', _controller2),
              const SizedBox(height: 10),
              _buildTextField('Total counter operator', _controller3),
              const SizedBox(height: 20),
              Text.rich(TextSpan(
                children: [
                  const TextSpan(
                      text: 'total murni ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  TextSpan(
                      text: '${_countermurni.toInt()}',
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFFEC4C01))),
                  const TextSpan(
                      text: ' counter',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                ],
              )),
              const SizedBox(height: 20),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: 'pendapatan overall ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  TextSpan(
                      text: '${_counterincome.toInt()}',
                      style: TextStyle(fontSize: 20, color: Color(0xFFEC4C01))),
                  TextSpan(
                      text: ' atau ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  TextSpan(
                      text: '${_percentincome.toInt()}%',
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFFEC4C01))),
                ],
              )),
              Text.rich(TextSpan(
                children: [
                  const TextSpan(
                      text: 'Lost ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  TextSpan(
                      text: '${_lostcounter.toInt()}',
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFFEC4C01))),
                  const TextSpan(
                      text: ' counter',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  const TextSpan(
                      text: ' atau ',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(83, 83, 83, 1))),
                  TextSpan(
                      text: '${_percentlost}%',
                      style: const TextStyle(
                          fontSize: 20, color: Color(0xFFEC4C01))),
                ],
              )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isFormFilled ? _calculateLostCounter : null,
                child: const Text(
                  "Hitung Hasil Akhir",
                  style: TextStyle(color: Color(0xFFEC4C01)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Color(0xFFEC4C01)),
        keyboardType: TextInputType.numberWithOptions(signed: true),
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w400),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEC4C01))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(83, 83, 83, 1))),
          floatingLabelStyle: const TextStyle(color: Color(0xFFEC4C01)),
        ),
      ),
    );
  }
}
