import 'package:flutter/material.dart';

class MyDissmisable extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyDissmisable> {
  final List<String> _list = List.generate(50, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dissmisable"),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final item = _list[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete),
              alignment: Alignment.centerLeft,
            ),
            secondaryBackground: Container(
              color: Colors.blueAccent,
              child: Icon(Icons.thumb_up),
              alignment: Alignment.centerRight,
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                _list.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    action: SnackBarAction(
                      textColor: Colors.white,
                      label: "Undo",
                      onPressed: () {
                        setState(() {
                          _list.insert(index, item);
                        });
                      },
                    ),
                    content: direction == DismissDirection.startToEnd
                        ? Text("$item Deleted")
                        : Text("$item Liked"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              });
            },
            child: ListTile(
              title: Center(
                child: Text(_list[index]),
              ),
            ),
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                final bool res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content:
                            Text("Are you Sure you want to delete $item ?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _list.removeAt(index);
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    });
                return res;
              }
            },
          );
        },
      ),
    );
  }
}
