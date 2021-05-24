import 'package:codechef/constants/colors.dart';
import 'package:codechef/screens/favUsers_screen.dart';
import 'package:codechef/screens/homepage.dart';
import 'package:codechef/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await FavouritePreferences.init();
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
      home: FavouriteScreen(),
    );
  }
}
