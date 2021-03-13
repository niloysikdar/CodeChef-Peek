import 'dart:convert';

class UserModel {
  final status,
      rating,
      star,
      highestRating,
      globalRank,
      countryRank,
      name,
      username,
      country,
      state,
      city,
      studentProf,
      institution,
      fullySolved,
      partiallySolved;

  UserModel({
    this.status,
    this.rating,
    this.star,
    this.highestRating,
    this.globalRank,
    this.countryRank,
    this.name,
    this.username,
    this.country,
    this.state,
    this.city,
    this.studentProf,
    this.institution,
    this.fullySolved,
    this.partiallySolved,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json["status"],
      rating: json["rating"],
      star: json["stars"],
      highestRating: json["highest_rating"],
      globalRank: json["global_rank"],
      countryRank: json["country_rank"],
      name: json["user_details"]["name"],
      username: json["user_details"]["username"],
      country: json["user_details"]["country"],
      state: json["user_details"]["state"],
      city: json["user_details"]["city"],
      studentProf: json["user_details"]["student/professional"],
      institution: json["user_details"]["institution"],
      fullySolved: json["fully_solved"]["count"],
      partiallySolved: json["partially_solved"]["count"],
    );
  }
}
