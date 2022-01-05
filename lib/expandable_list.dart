import 'package:flutter/material.dart';

class MyExpandableList extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyExpandableList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable List"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            backgroundColor: Colors.yellow,
            title: Text("First"),
            children: [
              Card(
                color: Colors.grey,
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Contact"),
                  subtitle: Text("Where you can call us"),
                  onTap: () {},
                ),
              ),
              Card(
                color: Colors.grey,
                child: ListTile(
                  title: Text("Contact"),
                  subtitle: Text("Where you can call us"),
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
