import 'package:flutter/material.dart';
import 'Models/Loans.dart';

class BillEntry extends StatefulWidget {
  const BillEntry({Key? key}) : super(key: key);

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final companyController = TextEditingController();
  final amountController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();
  late String selectedType = 'CREDIT_CARD';
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      backgroundColor: const Color(0x338ccdff),
      appBar: AppBar(
        title: const Text(
          'Bill Entry Page',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: selectedType,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedType = newValue!;
                      });
                    },
                    items: ["CREDIT_CARD", "LOAN"]
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
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the Company',
                    ),
                    controller: companyController,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter an Amount',
                    ),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Rate',
                    ),
                    keyboardType: TextInputType.number,
                    controller: rateController,
                  ),
                ),
                Expanded(
                  child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Time Frame',
                      ),
                      keyboardType: TextInputType.number,
                      controller: timeController),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isChecked,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text(
                  'Reccurring?',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    debugPrint(isChecked.toString());
                    Loans.createLoan(
                        companyController.text,
                        amountController.text,
                        rateController.text,
                        selectedType,
                        isChecked);
                  },
                  child: const Text('Save Loan'),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  rateController.text,
                ),
                Text(
                  selectedType,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
