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
  TextEditingController usernamecontroller;

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavbar(
          context: context,
          size: size,
          isHomeActive: true,
          isFavourite: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  headerLogo(size: size),
                  SizedBox(height: size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: inputField(
                      controller: usernamecontroller,
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  InkWell(
                    onTap: () {
                      print("Getting user");
                      getUser(
                        context: context,
                        username: usernamecontroller.text,
                      );
                    },
                    child: getButton(size: size),
                  ),
                ],
              ),
            ),
            searching(size: size),
          ],
        ),
      ),
    );
  }

  Widget searching({@required Size size}) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        Center(
          child: SizedBox(
            height: size.width * 0.2,
            width: size.width * 0.2,
            child: CircularProgressIndicator(
              backgroundColor: kblack,
            ),
          ),
        ),
      ],
    );
  }

  Widget getButton({@required Size size}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            klightbackground,
            klightgreen,
            kwhite,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: klightgreen,
            blurRadius: 0.0,
            spreadRadius: 2.0,
            offset: Offset(-1, 1),
          )
        ],
      ),
      child: Center(
        child: Text(
          "Get Details",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget inputField({@required TextEditingController controller}) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 22,
        color: klightwhite,
      ),
      cursorColor: klightgreen,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        hintText: 'Codechef Username',
        hintStyle: TextStyle(
          color: Colors.white60,
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: klightgreen,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

getUser({@required BuildContext context, @required String username}) async {
  try {
    http.Response response = await getResponse(username);
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
