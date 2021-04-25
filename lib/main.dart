import 'package:codechef/constants/colors.dart';
import 'package:codechef/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

ThemeData _darkTheme = ThemeData(
  accentColor: klightgreen,
  brightness: Brightness.dark,
  primaryColor: klightgreen,
  scaffoldBackgroundColor: kdarkbackground,
);

/*ThemeData _lightTheme = ThemeData(
  accentColor: Colors.black,
  brightness: Brightness.light,
  primaryColor: Colors.black,
);*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _darkTheme,
      home: HomePage(),
    );
  }
}
