import 'package:flutter/material.dart';

/// Dropdown selection takes in a list needed for the dropdown
/// returns the dropdown in standard format throughout the app.
///
class DropdownSelection extends StatefulWidget {
  const DropdownSelection(
      {Key? key, required this.dropdownList, this.dropdownController})
      : super(key: key);

  final List<String> dropdownList;
  final TextEditingController? dropdownController;

  @override
  _DropdownSelectionState createState() => _DropdownSelectionState();
}

class _DropdownSelectionState extends State<DropdownSelection> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownList.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
      ),
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}
