import 'package:flutter/material.dart';
import 'package:wfapp/UI%20Folder/HomepageUI.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather Forecast",
      home: MainHome(),
    );
  }
}


