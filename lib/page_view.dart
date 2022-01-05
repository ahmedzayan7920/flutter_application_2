import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/alert_dialog.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';

class Data {
  final title;
  final description;
  final imageUrl;
  final iconData;

  Data({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.iconData,
  });
}

class MyPageView extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyPageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex < 3) {
        _currentIndex++;
      }

      _controller.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeIn,
      );
    });
  }

  final List<Data> myData = [
    Data(
      title: "Title 1",
      description:
          "Here I want display a list that I obtain from an api. In order to not obtain the error, I set my defaultdropdownvalue with the name ‘Encajes’ that is one of the existing categories that my list contains.",
      imageUrl: "images/4.jpg",
      iconData: Icons.add_box,
    ),
    Data(
      title: "Title 2",
      description:
          "Here I want display a list that I obtain from an api. In order to not obtain the error, I set my defaultdropdownvalue with the name ‘Encajes’ that is one of the existing categories that my list contains.",
      imageUrl: "images/5.jpg",
      iconData: Icons.face,
    ),
    Data(
      title: "Title 3",
      description:
          "Here I want display a list that I obtain from an api. In order to not obtain the error, I set my defaultdropdownvalue with the name ‘Encajes’ that is one of the existing categories that my list contains.",
      imageUrl: "images/6.jpg",
      iconData: Icons.safety_divider,
    ),
    Data(
      title: "Title 4",
      description:
          "Here I want display a list that I obtain from an api. In order to not obtain the error, I set my defaultdropdownvalue with the name ‘Encajes’ that is one of the existing categories that my list contains.",
      imageUrl: "images/7.jpg",
      iconData: Icons.mail_outline,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: myData
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(item.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item.iconData, size: 150),
                        const SizedBox(height: 50),
                        Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item.description,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                /**
                 * if (_currentIndex == 3) {
                  Future.delayed(
                    Duration(seconds: 2),
                    () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setBool('seen', true);
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyAlertDialog(),
                        ),
                      );
                    },
                  );
                } */
              });
            },
            controller: _controller,
          ),
          Align(
            alignment: Alignment(0, 0.82),
            child: PageViewIndicator(
              length: myData.length,
              currentIndex: _currentIndex,
              currentColor: Colors.white,
              otherColor: Colors.red,
              currentSize: 20,
              otherSize: 10,
              margin: EdgeInsets.all(5),
              borderRadius: 9999.0,
              alignment: MainAxisAlignment.center,
              animationDuration: Duration(milliseconds: 150),
            ),
          ),
          /*
          Align(
            alignment: Alignment(0, .83),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircleDots(0),
                buildCircleDots(1),
                buildCircleDots(2),
                buildCircleDots(3),
              ],
            ),
          ),*/
          Align(
            alignment: Alignment(0, .98),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                ),
                child: Text("Get Started", style: TextStyle(fontSize: 30)),
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setBool('seen', true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAlertDialog()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircleDots(int index) {
    return _currentIndex != index
        ? Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
              color: _currentIndex == index ? Colors.green : Colors.red,
            ),
          )
        : Icon(Icons.add);
  }
}
