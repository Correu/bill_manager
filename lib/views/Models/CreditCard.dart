import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CreditCard {
  Response? response;

  CreditCard({this.response});


}

class Response {
  List<Results>? results;

  Response({this.results});
}

class Results {
  int? id;
  String? company;
  double? balance;
  double? creditLim;
  double? rate;
  String? dueDate;

  Results({
    this.id,
    this.company,
    this.balance,
    this.creditLim,
    this.rate,
    this.dueDate
  });

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