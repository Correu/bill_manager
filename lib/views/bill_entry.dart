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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
            ),
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
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: selectedType,
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
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the Company',
                    ),
                    controller: companyController,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
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
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                ),
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
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
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
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
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
                const Padding(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                ),
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
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
