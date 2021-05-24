import 'dart:convert';
import 'package:codechef/models/favouriteuser_model.dart';
import 'package:codechef/services/shared_preferences.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              child: Text("Press"),
              onPressed: () {
                FavouriteUser favouriteUser = FavouriteUser(
                  name: "Niloy Sikdar",
                  username: "niloy_sikdar",
                );
                var map = FavouriteUser.toMap(favouriteUser);
                List users = [map, map, map];
                String favusers = json.encode(users);
                FavouritePreferences.setFav(favusers);
              },
            ),
            ElevatedButton(
              child: Text("Get"),
              onPressed: () {
                String fav = FavouritePreferences.getFav();
                List favusers = json.decode(fav);
                favusers.forEach((user) {
                  print(user["name"]);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
