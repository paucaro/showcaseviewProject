import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:showcaseview_flutter/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowCase Ejemplo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowCaseWidget(
          builder: Builder(
            builder: (context) => MainPage(),
          ),
        ),
      ),
    );
  }
}