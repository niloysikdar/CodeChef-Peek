import 'dart:convert';
import 'package:codechef/models/usermodel.dart';
import 'package:http/http.dart' as http;

Future getResponse(String username) async {
  final String url = "https://cp-api-v1.herokuapp.com/api/codechef/" +
      username.toString().trim();
  var finalurl = Uri.parse(url);

  http.Response response = await http.Client().get(finalurl);
  http.Client().close();

  return response;
}

Future<UserModel> getValidUser(http.Response response) async {
  final String responseString = response.body;
  return userModelFromJson(responseString);
}

Future<String> getInvalidUser(http.Response response) async {
  Map map = json.decode(response.body);
  return (map["details"]);
}
