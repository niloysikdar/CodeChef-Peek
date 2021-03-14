class UserModel {
  final String status,
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
      status: json["status"].toString(),
      rating: json["rating"].toString(),
      star: json["stars"].toString(),
      highestRating: json["highest_rating"].toString(),
      globalRank: json["global_rank"].toString(),
      countryRank: json["country_rank"].toString(),
      name: json["user_details"]["name"].toString(),
      username: json["user_details"]["username"].toString(),
      country: json["user_details"]["country"].toString(),
      state: json["user_details"]["state"].toString(),
      city: json["user_details"]["city"].toString(),
      studentProf: json["user_details"]["student/professional"].toString(),
      institution: json["user_details"]["institution"].toString(),
      fullySolved: json["fully_solved"]["count"].toString(),
      partiallySolved: json["partially_solved"]["count"].toString(),
    );
  }
}
