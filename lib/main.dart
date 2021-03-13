import 'package:codechef/screens/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.blue[900],
  brightness: Brightness.dark,
  primaryColor: Colors.blue[800],
);

ThemeData _lightTheme = ThemeData(
  accentColor: Colors.black,
  brightness: Brightness.light,
  primaryColor: Colors.black,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkTheme,
      home: MainPage(),
    );
  }
}
