import 'dart:convert';
import 'package:http/http.dart' as http;

class DebtItems {
  Response? response;

  DebtItems({this.response});

  DebtItems.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }

  static Future<DebtItems> fetchItems() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/retrieveDebtItems'));

    if(response.statusCode == 200) {
      return DebtItems.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Debt Items');
    }
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
  int? amount;
  int? rate;
  int? timeFrame;
  String? type;
  int? recurring;

  Results({
    this.id,
    this.company,
    this.amount,
    this.rate,
    this.timeFrame,
    this.type,
    this.recurring,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    amount = json['amount'];
    rate = json['rate'];
    timeFrame = json['timeFrame'];
    type = json['type'];
    recurring = json['recurring'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['amount'] = amount;
    data['rate'] = rate;
    data['timeFrame'] = timeFrame;
    data['type'] = type;
    data['recurring'] = recurring;
    return data;
  }
}
