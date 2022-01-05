import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyPercentIndicator extends StatefulWidget {
  @override
  _MySpanState createState() => _MySpanState();
}

class _MySpanState extends State<MyPercentIndicator> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Percent Indicator"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: _value / 100,
                header: Text("Icon Header"),
                center: Text(
                  "${_value}%",
                  style: TextStyle(fontSize: 30),
                ),
                backgroundColor: Colors.green,
                progressColor: Colors.amber,
                animation: true,
                animationDuration: 1000,
              ),
              Slider(
                value: _value as double,
                onChanged: (value) {
                  setState(() {
                    _value = value as int;
                  });
                },
                min: 0,
                max: 100,
                divisions: 100,
                label: "$_value",
              ),
            ],
          ),
        )

        /** 
       * ListView(
        children: [
          CircularPercentIndicator(
            radius: 100,
            lineWidth: 10,
            percent: 0.7,
            header: Text("Icon Header"),
            center: Icon(
              Icons.person,
              size: 50,
              color: Colors.blue,
            ),
            backgroundColor: Colors.green,
            progressColor: Colors.amber,
            animation: true,
            animationDuration: 1000,
          ),
          SizedBox(height: 15),
          LinearPercentIndicator(
            width: 150,
            lineHeight: 15,
            percent: 0.7,
            center: Text("50%"),
            leading: Icon(Icons.sms_failed),
            trailing: Icon(Icons.badge_sharp),
            backgroundColor: Colors.grey,
            progressColor: Colors.green,
            linearStrokeCap: LinearStrokeCap.roundAll,
            animation: true,
            animationDuration: 1000,
          )
        ],
      ),
      */

        );
  }
}
