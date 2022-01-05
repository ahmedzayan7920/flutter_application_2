import 'package:flutter/material.dart';

class MyComboBox extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyComboBox> {
  String _selectedLetter = "A";
  List _listItems = ["A", "B", "C", "D", "E", "F"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Combo Box"),
      ),
      body: Center(
        child: Row(
          children: [
            Text("Select Letter"),
            DropdownButton(
              hint: Text("  "),
              items: _listItems.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              value: _selectedLetter,
              onChanged: (value) {
                setState(() {
                  _selectedLetter = value as String;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
