import 'package:bill_manager/views/Pages/EntryTypes/loan_entry_page.dart';
import 'package:flutter/material.dart';

class BillEntry extends StatefulWidget {
  const BillEntry({Key? key}) : super(key: key);

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  String? _loanType;
  List<String> loanTypeValue = ["CREDIT_CARD", "PERSONAL_LOAN"];

  final List<Widget> _loanTypes = <Widget>[
    const LoanInputPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Entry'),
      ),
      backgroundColor: const Color(0x338ccdff),
      body: Row(
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
              items: ["CREDIT_CARD", "PERSONAL_LOAN"]
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
                });
              },
              value: _loanType,
            ),
          ),
          Expanded(child: _loanTypes[_loanTypes.indexOf(_loanType)])
        ],
      ),
    );
  }
}
