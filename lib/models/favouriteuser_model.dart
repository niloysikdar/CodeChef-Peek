import 'package:flutter/material.dart';

class FavouriteUser {
  final String username;
  final String name;

  FavouriteUser({
    @required this.username,
    @required this.name,
  });

  static Map<String, dynamic> toMap(FavouriteUser favouriteUser) => {
        'username': favouriteUser.username,
        'name': favouriteUser.name,
      };
}
