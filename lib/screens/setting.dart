import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            width: 400,
            height: 40,
            child: Text(
              "Setting",
              style: TextStyle(fontSize: 20, color: Color(0xFFEC4C01)),
            ),
          ),
          Expanded(
            child: Container(), // Kosongkan Expanded
          ),
          Text(
            "Versi 0.10",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
