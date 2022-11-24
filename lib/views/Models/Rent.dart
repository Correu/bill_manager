import 'dart:convert';
import 'package:http/http.dart' as http;

class Rent {
  Response? response;

  Rent({this.response});

  Rent.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(response != null) {
      //data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  List<Results>? results;

  Response.fromJson(Map<String, dynamic> json) {
    //response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
}

class Results {
  
}