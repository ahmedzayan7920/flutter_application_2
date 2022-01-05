import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:global_snack_bar/global_snack_bar.dart';

class MySnackBar extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MySnackBar> {
  String _str = "Snack Bar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_str),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Show Snack Bar"),
          onPressed: () {
            setState(() {
              _str = "";
            });
            buildSnackBar(context);
          },
        ),
      ),
    );
  }

  void buildSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          textColor: Colors.white,
          label: "Undo",
          onPressed: () {
            setState(() {
              _str = "Snack Bar";
            });
          },
        ),
        content: const Text("Login failed"),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
