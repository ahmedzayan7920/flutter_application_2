import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyInteractiveViewer extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyInteractiveViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyInteractiveViewer"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: InteractiveViewer(
            child: Image.asset(
              'images/6.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
