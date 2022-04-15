import 'package:bill_manager/views/Widgets/offer_type_dropdown.dart';
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
                  child: OfferTypeDropdown(),
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
                      hintText: 'Enter a Rate',
                    ),
                    keyboardType: TextInputType.number,
                    controller: rateController,
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
                    Loans.createLoan(companyController.text,
                        amountController.text, rateController.text);
                  },
                  child: const Text('Save Loan'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
