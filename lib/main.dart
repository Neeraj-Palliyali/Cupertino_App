import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_app/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

