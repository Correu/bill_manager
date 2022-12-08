import 'dart:convert';
import 'package:bill_manager/views/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CreditCard {
  Response? response;

  CreditCard({this.response});

  CreditCard.fromJson(Map<String, dynamic> json) {
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

  ///
  ///Create a credit card
  ///
  Future<bool> createCard(String company, String balance, String creditLim,
      String rate, String dueDate) async {
    final response = await http.post(
      Uri.parse(baseURL + 'api/createNewCard'),
      headers: <String, String>{
        'Accept': 'application/json',
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'company': company,
        'balance': balance,
        'credit_lim': creditLim,
        'rate': rate,
        'due_day': dueDate,
      }),
    );
    debugPrint('${response.statusCode}');
    debugPrint(response.body);
    if(response.statusCode == 200) {
      debugPrint("Success card create");
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
      data['results'] = results!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? company;
  double? balance;
  double? creditLim;
  double? rate;
  String? dueDate;

  Results(
      {this.id,
      this.company,
      this.balance,
      this.creditLim,
      this.rate,
      this.dueDate});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    balance = json['balance'];
    creditLim = json['credit_lim'];
    rate = json['rate'];
    dueDate = json['due_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['balance'] = balance;
    data['credit_lim'] = creditLim;
    data['rate'] = rate;
    data['due_day'] = dueDate;
    return data;
  }
}
