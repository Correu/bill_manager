import 'package:bill_manager/views/Widgets/offer_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'Models/Loans.dart';

class BillEntry extends StatefulWidget {
  const BillEntry({Key? key}) : super(key: key);

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  final List<String> billEntryDropdownOptions = ["Credit Card", "Loan"];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final typeController = TextEditingController();
  final companyController = TextEditingController();
  final amountController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: DropdownSelection(
                    dropdownList: billEntryDropdownOptions,
                    dropdownController: typeController,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    debugPrint(typeController.text);
                    Loans.createLoan(
                        companyController.text,
                        amountController.text,
                        rateController.text,
                        typeController.text);
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
                  typeController.text,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
