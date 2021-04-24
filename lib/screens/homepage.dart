import 'dart:ui';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/func/getuser.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/screens/userscreen.dart';
import 'package:codechef/widgets/bottomnavbar.dart';
import 'package:codechef/widgets/headerlogo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kdarkbackground,
        body: Stack(
          children: [
            bottomNavbar(
              context: context,
              size: size,
              isHomeActive: true,
              isFavourite: false,
            ),
            Column(
              children: [
                headerLogo(size: size),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField({TextEditingController controller}) {
    return TextField(
      controller: usernamecontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: Icon(Icons.search),
        hintText: "username",
      ),
    );
  }
}

getUser(BuildContext context) async {
  try {
    http.Response response = await getResponse("");
    if (response.statusCode != 404) {
      try {
        UserModel userModel = await getValidUser(response);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(
              userModel: userModel,
            ),
          ),
        );
      } catch (e) {
        print(await getInvalidUser(response));
      }
    } else {
      print("Getiing error");
    }
  } catch (e) {
    print("Check your internet connection");
  }
}
