import 'dart:ui';
import 'package:codechef/constants/colors.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/screens/userscreen.dart';
import 'package:codechef/services/getuser.dart';
import 'package:codechef/services/transitions.dart';
import 'package:codechef/services/validation.dart';
import 'package:codechef/widgets/headerlogo.dart';
import 'package:codechef/widgets/radial_menubar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/colors.dart';
import '../constants/colors.dart';
import '../constants/colors.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernamecontroller;
  bool isSearching = false;
  final _formKey = GlobalKey<FormState>();

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
        bottomNavigationBar: (!isSearching)
            ? Container(
                constraints: BoxConstraints(
                  minHeight: 170,
                ),
                color: Colors.transparent,
                child: RadialMenubar(),
              )
            : null,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  headerLogo(
                    size: size,
                    context: context,
                  ),
                  SizedBox(height: size.height * 0.1),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: inputField(
                        controller: usernamecontroller,
                      ),
                    ),
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInToLinear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-(size.width / 2) * value, 0.0),
                        child: child,
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.1),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    child: getButton(size: size),
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInToLinear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset((size.width / 2) * value, 0.0),
                        child: child,
                      );
                    },
                  ),
                ],
              ),
            ),
            (isSearching)
                ? searching(size: size)
                : Container(height: 0, width: 0),
          ],
        ),
      ),
    );
  }

  serchUser() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isSearching = true;
      });
      await getUser(
        context: context,
        username: usernamecontroller.text,
      );
      setState(() {
        isSearching = false;
      });
    }
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
    return InkWell(
      onTap: () {
        serchUser();
      },
      child: Container(
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
              Colors.white60,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: klightgreen.withOpacity(0.6),
              blurRadius: 0.0,
              spreadRadius: 1.0,
              offset: Offset(-1, 1),
            ),
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
      ),
    );
  }

  Widget inputField({@required TextEditingController controller}) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 22,
          color: klightwhite,
        ),
        cursorColor: klightgreen,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          hintText: 'Codechef Username',
          hintStyle: TextStyle(
            color: Colors.white60,
          ),
          errorStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
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
        validator: nameValidate,
      ),
    );
  }
}

getUser({
  @required BuildContext context,
  @required String username,
}) async {
  try {
    http.Response response = await getResponse(username);
    if (response.statusCode != 404) {
      try {
        UserModel userModel = await getValidUser(response);
        Navigator.push(
          context,
          SlideLeftRoute(
            page: UserScreen(userModel: userModel),
          ),
        );
      } catch (e) {
        String res = await getInvalidUser(response);
        showalertFunc(context: context, title: res);
      }
    } else {
      showalertFunc(context: context, title: "Error, try again later !");
    }
  } catch (e) {
    showalertFunc(context: context, title: "Check your Internet Connection");
  }
}

showalertFunc({
  @required BuildContext context,
  @required String title,
}) {
  Alert(
    context: context,
    type: AlertType.error,
    style: AlertStyle(
      animationDuration: Duration(milliseconds: 350),
      animationType: AnimationType.grow,
      isCloseButton: false,
      alertBorder: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      titleStyle: TextStyle(color: Colors.white70),
      descStyle: TextStyle(color: Colors.white70),
    ),
    title: "Error !",
    desc: title,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => Navigator.pop(context),
        color: klightgreen,
      ),
    ],
  ).show();
}
