import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Codechef",
          style: TextStyle(),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (val) {},
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
