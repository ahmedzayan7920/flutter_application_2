import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:io';

class MyImagePicker extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyImagePicker> {
  File _image = File("");
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Image Picker"),
      ),
      body: Center(
        child:
            _image == File("") ? Text("No Image Selected") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Choose Picture From:"),
              content: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(color: Colors.blueAccent),
                    Container(
                      color: Colors.teal,
                      child: ListTile(
                        leading: Icon(Icons.image),
                        title: Text("Gallery"),
                        onTap: () {
                          getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.teal,
                      child: ListTile(
                        leading: Icon(Icons.add_a_photo),
                        title: Text("Camera"),
                        onTap: () {
                          getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
