import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyListWheelScrollView extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyListWheelScrollView> {
  static final List<String> _list = [
    "ahmed",
    "fewwe",
    "ahfdfsdfmed",
    "ahsfgmed",
    "dghdgh",
    "hfgh",
    "jfhjhgjf",
    "dsds",
    "lkilkl,",
    "ghfghf",
    "sfsdfsg",
    "kjl.jk",
    "ahdfhdmed",
    "ahmsgfsed",
    "sgsdg",
    "hgfhnf",
    "hgfhnf",
    "hgfhnf",
  ];

  final List<Color> colorList =
      List.generate(_list.length, (index) => Colors.primaries[index]);
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text("My List Wheel Scroll View"),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18),
          child: ListWheelScrollView(
            itemExtent: 100,
            children: _list.map((String name) {
              return Container(
                decoration: BoxDecoration(
                  color: colorList[i++],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.red),
                ),
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
