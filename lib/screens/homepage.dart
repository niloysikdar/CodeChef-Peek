import 'dart:ui';
import 'package:codechef/func/getuser.dart';
import 'package:codechef/models/usermodel.dart';
import 'package:codechef/screens/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Codechef",
            style: TextStyle(),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/codechef.jpg",
                  fit: BoxFit.fill,
                  height: 120.0,
                  width: 120.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: usernamecontroller,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter a topic",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          http.Response response =
                              await getResponse(usernamecontroller.text.trim());
                          if (response.statusCode != 404) {
                            try {
                              UserModel userModel =
                                  await getValidUser(response);
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
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search_outlined,
                          size: 36.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
