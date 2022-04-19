import 'package:flutter/material.dart';

class OfferTypeDropdown extends StatefulWidget {
  const OfferTypeDropdown({Key? key}) : super(key: key);

  @override
  _OfferTypeDropdownState createState() => _OfferTypeDropdownState();
}

class _OfferTypeDropdownState extends State<OfferTypeDropdown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
