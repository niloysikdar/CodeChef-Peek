import 'package:codechef/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<UserModel> getUser(String username) async {
  String url = "https://cp-api-v1.herokuapp.com/api/codechef/niloy_sikdar";
  http.Response response = await http.Client().get(url);
  if (response.statusCode != 200) {
    throw Exception();
  } else {
    return parsedJson(response.body);
  }
}

UserModel parsedJson(response) {
  final jsondecoded = json.decode(response);
  return UserModel.fromJson(jsondecoded);
}
