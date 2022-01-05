import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 100,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              ),
            ],
            leading: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle),
                  ),
                ),
              ],
            ),
            title: const Text(
              "Custom",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink,
                    Colors.purple,
                  ],
                ),
              ),
            ),
            centerTitle: true,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
