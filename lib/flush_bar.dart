import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';

class MyFlushBar extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyFlushBar> {
  String _str = "Snack Bar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_str),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Show FlushBar"),
          onPressed: () {
            buildFlushbar(context);
          },
        ),
      ),
    );
  }

  void buildFlushbar(BuildContext context) {
    Flushbar(
      title: 'Title',
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.info),
      backgroundColor: Colors.red,
      messageText: const Text(
        "data",
        style: TextStyle(color: Colors.yellow),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(30),
      mainButton: TextButton(
        child: Text("Undo"),
        onPressed: () {},
      ),
    ).show(context);
  }
}
