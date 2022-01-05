import 'package:flutter/material.dart';
import 'package:flutter_application_2/alert_dialog.dart';
import 'package:flutter_application_2/checkbox.dart';
import 'package:flutter_application_2/combo_box.dart';
import 'package:flutter_application_2/custom_app_bar.dart';
import 'package:flutter_application_2/flush_bar.dart';
import 'package:flutter_application_2/image_picker.dart';
import 'package:flutter_application_2/image_slider.dart';
import 'package:flutter_application_2/overflow.dart';
import 'package:flutter_application_2/page_view.dart';
import 'package:flutter_application_2/percent_indicator.dart';
import 'package:flutter_application_2/radio_button.dart';
import 'package:flutter_application_2/radio_list_tile.dart';
import 'package:flutter_application_2/snack_bar.dart';
import 'package:flutter_application_2/span.dart';
import 'package:flutter_application_2/text_form_field.dart';
import 'package:flutter_application_2/toast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'color_picker.dart';
import 'dissmisable.dart';
import 'expandable_list.dart';
import 'interactive_viewer.dart';
import 'list_wheel_scroll_view.dart';
import 'multi_image_picker.dart';

void main() async {
  /**
   * WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool seen = preferences.getBool('seen') == null ? false : true;
  if (seen) {
    runApp(MyAlertDialog());
  } else {
    runApp(const MyApp());
  }
   */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'More UI',
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
      darkTheme:
          ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.black),
      home: MyInteractiveViewer(),
    );
  }
}
