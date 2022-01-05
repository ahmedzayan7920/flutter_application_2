import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyToast extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toast"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showToast(
            'This is normal toast with animation',
            context: context,
            animation: StyledToastAnimation.scale,
            reverseAnimation: StyledToastAnimation.fade,
            position:
                StyledToastPosition(align: Alignment.bottomCenter, offset: 200),
            animDuration: Duration(seconds: 1),
            duration: Duration(seconds: 4),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
        },
        child: Icon(Icons.show_chart),
      ),
    );
  }
}
