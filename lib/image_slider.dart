import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyImageSlider extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyImageSlider> {
  List images = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Slider"),
        ),
        body: ListView(
          children: [
            SizedBox(height: 40),
            Text("this is images caption", textAlign: TextAlign.center),
            CarouselSlider(
              items: images.map((url) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.yellow)),
                  child: Image.asset(url, fit: BoxFit.fill),
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayInterval: Duration(milliseconds: 1000),
                enableInfiniteScroll: true,
                reverse: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCircleDots(0),
                buildCircleDots(1),
                buildCircleDots(2),
              ],
            ),
            SizedBox(height: 50),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int x) {
                return Container(
                  child: Image.asset(images[index], fit: BoxFit.fill),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                );
              },
              options: CarouselOptions(
                height: 300,
                initialPage: 0,
              ),
            )
          ],
        ));
  }

  Container buildCircleDots(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
        color: _currentIndex == index ? Colors.black : Colors.white,
      ),
    );
  }
}
