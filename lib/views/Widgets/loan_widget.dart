import 'package:flutter/material.dart';

class LoanWidget extends StatelessWidget {
  const LoanWidget({Key? key, required this.company, required this.amount})
      : super(key: key);

  final String company;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  company,
                ),
              ),
              Expanded(
                child: Text(
                  company,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '\$ $amount',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
