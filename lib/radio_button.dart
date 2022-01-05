import 'dart:ui';

import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyRadioButton> {
  int _groupValue = 0;
  Color _resultColor = Colors.red;
  String _result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button"),
      ),
      body: Column(
        children: [
          Text(
            "2 + 2 = ?",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          buildRadioRow(3, "Wrong Answer", Colors.red),
          buildRadioRow(4, "Correct Answer", Colors.green),
          buildRadioRow(5, "Wrong Answer", Colors.red),
        ],
      ),
    );
  }

  Future<dynamic> buildDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_result,
                    style: TextStyle(fontSize: 30, color: _resultColor)),
                Divider(height: 10),
                _resultColor == Colors.red
                    ? Text("Correct Answer is 4",
                        style: TextStyle(fontSize: 30))
                    : Text(""),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      barrierDismissible: false,
      useSafeArea: true,
    );
  }

  Row buildRadioRow(int value, String result, Color resultColor) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value as int;
              _result = result;
              _resultColor = resultColor;
              buildDialog(context);
            });
          },
        ),
        Text("$value",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ],
    );
  }
}
