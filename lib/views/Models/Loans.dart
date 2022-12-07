import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Loans {
  Response? response;

  Loans({this.response});

  Loans.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }

  //return data about a specific users loans
  static Future<Loans> fetchLoans() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/retrieveLoan'));

    if (response.statusCode == 200) {
      return Loans.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load loans');
    }
  }

  //send data to post route to create loan
  Future<bool> createLoan(String company, String amount,
      String rate, String time, String type) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/saveLoan'),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'company': company,
        'amount': amount,
        'rate': rate,
        'time_frame': time,
        'type': type,
      }),
    );
    debugPrint('${response.statusCode}');
    debugPrint(response.body);

    if(response.statusCode == 200) {
      debugPrint("Success credit card creation");
      return true;
    }
    return false;
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
  int? id;
  String? company;
  int? amount;
  String? rate;
  int? timeFrame;
  String? dueDay;

  Results({
    this.id,
    this.company,
    this.amount,
    this.rate,
    this.timeFrame,
    this.dueDay,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    amount = json['amount'];
    rate = json['rate'];
    timeFrame = json['time_frame'];
    dueDay = json['due_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['amount'] = amount;
    data['rate'] = rate;
    data['time_frame'] = timeFrame;
    data['due_day'] = dueDay;
    return data;
  }
}
