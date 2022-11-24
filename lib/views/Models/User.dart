import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//firebase auth packages
import 'package:firebase_auth/firebase_auth.dart';

//device information imports
import 'package:device_info_plus/device_info_plus.dart';

const String baseURL = 'http://10.0.2.2:8000/';

class User {
  Response? response;
  bool _isAuthenticated = false;

  User({this.response});

  User.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();

    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }

  ///
  /// Create a new user
  ///
  Future<bool> createUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(baseURL + 'api/createNewUser'),
      headers: <String, String>{
        'Accept': 'application/json',
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    debugPrint('${response.statusCode}'); 
    if (response.statusCode == 200) {
      debugPrint("Success Create User");
      return true;
    }

    return false;
  }

  Future<http.Response> loginUser(String email, String password, String device) async {
    final response = await http.post(Uri.parse(baseURL + 'api/mobileLogin'),
        headers: <String, String>{
          'Accept': 'application/json',
          'content-type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
            'password': password,
            'device_name': device,
          },
        ));

        debugPrint('${response.statusCode}');

        //if successful sign in save token and return content
        if(response.statusCode == 200) {
          String token = response.body;
          debugPrint("login success $token");
          await saveToken(token);
          _isAuthenticated = true;
        }

        return response;
  }

  ///
  /// save token to the device for auth state changes.
  ///
  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}

class Response {
  List<Results>? results;

  Response({this.results});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? email;
  String? password;

  Results({
    this.name,
    this.email,
    this.password,
  });

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}