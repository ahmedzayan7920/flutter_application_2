import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';

class MyOverflow extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyOverflow> {
  String _str = "Snack Bar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_str),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            "nvfjlkdnvjkldn jgrjegijoe jefgoejgo egfoiejoi",
            showCursor: true,
            cursorColor: Colors.red,
            cursorWidth: 10,
            toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
              cut: true,
              paste: true,
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              "jkfvkdfkvhnelfkvhbkjdfvkjdflvkjhndfkvjdnhkfjvnhdfkjvbkdjfvbhkjdfvbkjdfnhvkjdfhvkhdkvhdhkvhkdhvnkjdhvkjdnhvkjdhnvkhdk",
              overflow: TextOverflow.clip,
              softWrap: false,
              style: TextStyle(fontSize: 35),
            ),
            color: Colors.green,
            height: 70,
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              "jkfvkdfkvhnelfkvhbkjdfvkjdflvkjhndfkvjdnhkfjvnhdfkjvbkdjfvbhkjdfvbkjdfnhvkjdfhvkhdkvhdhkvhkdhvnkjdhvkjdnhvkjdhnvkhdk",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(fontSize: 35),
            ),
            color: Colors.green,
            height: 70,
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              "jkfvkdfkvhnelfkvhbkjdfvkjdflvkjhndfkvjdnhkfjvnhdfkjvbkdjfvbhkjdfvbkjdfnhvkjdfhvkhdkvhdhkvhkdhvnkjdhvkjdnhvkjdhnvkhdk",
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(fontSize: 35),
            ),
            color: Colors.green,
            height: 70,
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              "jkfvkdfkvhnelfkvhbkjdfvkjdflvkjhndfkvjdnhkfjvnhdfkjvbkdjfvbhkjdfvbkjdfnhvkjdfhvkhdkvhdhkvhkdhvnkjdhvkjdnhvkjdhnvkhdk",
              overflow: TextOverflow.visible,
              softWrap: false,
              style: TextStyle(fontSize: 35),
            ),
            color: Colors.green,
            height: 70,
          ),
        ],
      )),
    );
  }
}
