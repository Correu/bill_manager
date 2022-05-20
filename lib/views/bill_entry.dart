import 'package:bill_manager/views/Pages/EntryTypes/loan_entry_page.dart';
import 'package:flutter/material.dart';

class BillEntry extends StatefulWidget {
  const BillEntry({Key? key}) : super(key: key);

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  int _typeIndex = 0;

  final List<Widget> _loanTypes = <Widget>[
    const LoanInputPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              value: _typeIndex,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(
                  color: Colors.blue, backgroundColor: Color(0x338ccdff)),
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: ["CREDIT_CARD", "PERSONAL_LOAN"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          ),
          _loanTypes[_typeIndex],
        ],
      ),
    );
  }
}
