import 'package:flutter/material.dart';

class MyChechBox extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyChechBox> {
  bool js = false;
  bool python = false;
  bool dart = false;

  String get dialogBody {
    String str = "";
    if (js) str += "Java Script";
    if (python) str += "\nPython";
    if (dart) str += "\nDart";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Box"),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CheckboxListTile(
              value: js,
              onChanged: (value) {
                setState(() {
                  js = value as bool;
                });
              },
              title: Text("Java Script", style: TextStyle(fontSize: 30)),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Row(
              children: [
                Checkbox(
                    value: python,
                    onChanged: (value) {
                      setState(() {
                        python = value as bool;
                      });
                    }),
                Text(
                  "Python",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: dart,
                    onChanged: (value) {
                      setState(() {
                        dart = value as bool;
                      });
                    }),
                Text(
                  "Dart",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            ElevatedButton(
                child: const Text("Apply"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("You Selected",
                              style: TextStyle(fontSize: 35)),
                          content: Container(
                            width: double.infinity,
                            child: Text(dialogBody),
                          ),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
