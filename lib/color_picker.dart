import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyColorPicker extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyColorPicker> {
  Color currentColor = Colors.blue;
  final List<Color> _availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.grey,
    Colors.yellow,
    Colors.black,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Color Picker"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: Text(
              '(Block) Change My color',
              style: TextStyle(
                color: useWhiteForeground(currentColor)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Select a Color"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: BlockPicker(
                            availableColors: _availableColors,
                            pickerColor: currentColor,
                            onColorChanged: (val) {
                              setState(() {
                                currentColor = val;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"))
                      ],
                    ),
                  );
                },
                barrierDismissible: false,
                useSafeArea: true,
              );
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            child: Text(
              '(Material) Change My color',
              style: TextStyle(
                color: useWhiteForeground(currentColor)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Select a Color"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: MaterialPicker(
                            pickerColor: currentColor,
                            onColorChanged: (val) {
                              setState(() {
                                currentColor = val;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"))
                      ],
                    ),
                  );
                },
                barrierDismissible: false,
                useSafeArea: true,
              );
            },
          ),
          SizedBox(height: 15),
          ElevatedButton(
            child: Text(
              '(Color) Change My color',
              style: TextStyle(
                color: useWhiteForeground(currentColor)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Select a Color"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: currentColor,
                            onColorChanged: (val) {
                              setState(() {
                                currentColor = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Choose"))
                      ],
                    ),
                  );
                },
                barrierDismissible: false,
                useSafeArea: true,
              );
            },
          ),
        ],
      )),
    );
  }
}
