import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/src/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}