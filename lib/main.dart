import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contest Reminder',
      theme: ThemeData(
        primaryColor: new Color(0xff013db7),
      ),
      home: HomeScreen(),
    );
  }
}
