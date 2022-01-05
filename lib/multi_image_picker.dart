import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:io';

class MyMultiImagePicker extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyMultiImagePicker> {
  List<Asset> images = [];

  Future loadAssets() async {
    try {
      List<Asset> result = await MultiImagePicker.pickImages(
        maxImages: 33,
        selectedAssets: images,
        enableCamera: true,
      );
      setState(() {
        images = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Multi Image Picker"),
        actions: [
          TextButton(
            onPressed: loadAssets,
            child: Text(
              "Pick Images",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          images.length,
          (index) => AssetThumb(
            asset: images[index],
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
