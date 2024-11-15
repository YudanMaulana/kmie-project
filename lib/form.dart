// import 'dart:math';
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
  double _tominute = 0;

  bool _isFormFilled = false;
  bool _isResultVisible = false;

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
          title: const Text("Perhatian"),
          content: const Text("Semua field harus diisi"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
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
      _tominute = (_countermurni - _lostcounter) / 60;
      _isResultVisible = true;
    });
  }

  void _resetForm() {
    setState(() {
      _isResultVisible = false;
      _countermurni = 0;
      _lostcounter = 0;
      _percentlost = 0;
      _percentincome = 0;
      _counterincome = 0;
      _tominute = 0;
      _controller1.clear();
      _controller2.clear();
      _controller3.clear();
      _isFormFilled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text.rich(TextSpan(children: [
            TextSpan(
                text: "Knitting Machine ",
                style: TextStyle(
                    color: Color.fromRGBO(83, 83, 83, 1), fontSize: 22)),
            TextSpan(
                text: "Instant Efficiency ",
                style: TextStyle(color: Color(0xFFEC4C01), fontSize: 22)),
          ])),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0.8, 0),
                child: Form(
                  child: Column(
                    children: [
                      _buildTextField('RPM Mesin', _controller1),
                      _buildTextField('Jam Kerja', _controller2),
                      const SizedBox(height: 10),
                      _buildTextField('Total counter operator', _controller3),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed:
                                _isFormFilled ? _calculateLostCounter : null,
                            child: const Text(
                              "Hitung Hasil Akhir",
                              style: TextStyle(color: Color(0xFFEC4C01)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _resetForm,
                            child: const Text(
                              "Reset",
                              style: TextStyle(color: Color(0xFFEC4C01)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (_isResultVisible)
                        DataTableExample(
                          countermurni: _countermurni,
                          counterincome: _counterincome,
                          percentincome: _percentincome,
                          lostcounter: _lostcounter,
                          percentlost: _percentlost,
                          tominute: _tominute,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        style: const TextStyle(color: Color(0xFFEC4C01)),
        keyboardType: const TextInputType.numberWithOptions(signed: true),
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

class DataTableExample extends StatelessWidget {
  final double countermurni;
  final double counterincome;
  final double percentincome;
  final double lostcounter;
  final double percentlost;
  final double tominute;

  const DataTableExample({
    super.key,
    required this.countermurni,
    required this.counterincome,
    required this.percentincome,
    required this.lostcounter,
    required this.percentlost,
    required this.tominute,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10,
      columnSpacing: 40,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Jenis',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xFFEC4C01)),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Counter',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xFFEC4C01)),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Persen',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xFFEC4C01)),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Menit',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Color(0xFFEC4C01)),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('Counter murni')),
            DataCell(Text('${countermurni.toInt()}')),
            const DataCell(Text('100%')),
            DataCell(Text('-')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('Pendapatan')),
            DataCell(Text('${counterincome.toInt()}')),
            DataCell(Text('${percentincome.toInt()}%')),
            DataCell(Text('-')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('Lost Counter')),
            DataCell(Text('${lostcounter.toInt()}')),
            DataCell(Text('${percentlost}%')),
            DataCell(Text('${tominute.toInt()}')),
          ],
        ),
      ],
    );
  }
}
