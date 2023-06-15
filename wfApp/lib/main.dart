import 'package:flutter/material.dart';
import 'package:wfapp/UI%20Folder/HomepageUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Weather Forecast",
      home: MainHome(),
    );
  }
}


