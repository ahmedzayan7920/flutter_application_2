import 'package:flutter/material.dart';

class MyRadioListTile extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyRadioListTile> {
  int _groupValue = 0;
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio List Tile"),
      ),
      body: Container(
        color: _groupValue == 0 ? Colors.brown : Colors.green,
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            buildRadio(0, "Brown", "Change BackGround to Brown"),
            buildRadio(1, "Green", "Change BackGround to Green"),
          ],
        ),
      ),
    );
  }

  RadioListTile<int> buildRadio(int value, String text, String subText) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: (value) {
        setState(() {
          _groupValue = value as int;
        });
      },
      title: Text(text),
      subtitle: Text(subText),
    );
  }
}
