// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.rating,
    this.stars,
    this.highestRating,
    this.globalRank,
    this.countryRank,
    this.userDetails,
    this.fullySolved,
    this.partiallySolved,
  });

  String status;
  int rating;
  String stars;
  int highestRating;
  int globalRank;
  int countryRank;
  UserDetails userDetails;
  LlySolved fullySolved;
  LlySolved partiallySolved;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        rating: json["rating"],
        stars: json["stars"],
        highestRating: json["highest_rating"],
        globalRank: json["global_rank"],
        countryRank: json["country_rank"],
        userDetails: UserDetails.fromJson(json["user_details"]),
        fullySolved: LlySolved.fromJson(json["fully_solved"]),
        partiallySolved: LlySolved.fromJson(json["partially_solved"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "rating": rating,
        "stars": stars,
        "highest_rating": highestRating,
        "global_rank": globalRank,
        "country_rank": countryRank,
        "user_details": userDetails.toJson(),
        "fully_solved": fullySolved.toJson(),
        "partially_solved": partiallySolved.toJson(),
      };
}

class LlySolved {
  LlySolved({
    this.count,
  });

  int count;

  factory LlySolved.fromJson(Map<String, dynamic> json) => LlySolved(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class UserDetails {
  UserDetails({
    this.name,
    this.username,
    this.country,
    this.state,
    this.city,
    this.studentProfessional,
    this.institution,
  });

  String name;
  String username;
  String country;
  String state;
  String city;
  String studentProfessional;
  String institution;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        username: json["username"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        studentProfessional: json["student/professional"],
        institution: json["institution"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "country": country,
        "state": state,
        "city": city,
        "student/professional": studentProfessional,
        "institution": institution,
      };
}
