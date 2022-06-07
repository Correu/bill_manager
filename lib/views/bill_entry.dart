import 'package:bill_manager/views/Pages/EntryTypes/bill_entry_page.dart';
import 'package:bill_manager/views/Pages/EntryTypes/loan_entry_page.dart';
import 'package:flutter/material.dart';

class BillEntry extends StatefulWidget {
  const BillEntry({Key? key}) : super(key: key);

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  String? _loanType = "CREDIT_CARD";
  List<String> loanTypeValue = ["CREDIT_CARD", "PERSONAL_LOAN"];

  final List<Widget> _loanTypes = <Widget>[
    const LoanInputPage(),
    const BillInputPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Entry'),
      ),
      backgroundColor: const Color(0x338ccdff),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(
                  5.0,
                ),
              ),
              const Text(
                'Select a Type',
              ),
              const Padding(
                padding: EdgeInsets.all(
                  5.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(
                  5.0,
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.blue, backgroundColor: Color(0x338ccdff)),
                  items: loanTypeValue
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _loanType = value;
                      debugPrint(_loanType.toString());
                    });
                  },
                  value: _loanType,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _loanTypes[loanTypeValue.indexOf(_loanType.toString())],
              ),
            ],
          )
        ],
      ),
    );
  }
}
