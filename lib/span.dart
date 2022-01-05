import 'package:flutter/material.dart';

class MySpan extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MySpan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Span"),
      ),
      body: Center(
          child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Pink",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            TextSpan(
              text: "/",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            TextSpan(
              text: "Amber",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ],
        ),
      )),
    );
  }
}
