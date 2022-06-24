import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  Response? response;

  User({this.response});

  User.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }

  //used to determine if user or not.
  static Future<User> fetchUser() async {
    final response = await http.get(Uri.parse("URL for User Authentication"));

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('User Error');
    }
  }
  
}