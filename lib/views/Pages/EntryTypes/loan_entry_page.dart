import 'package:bill_manager/views/Models/Loans.dart';
import 'package:flutter/material.dart';

///
/// LoanInputPage - 
/// Input page for user to put in loan information of varying types
/// (Personal, Business, Auto, etc...)
///
class LoanInputPage extends StatefulWidget {
  const LoanInputPage({Key? key}) : super(key: key);

  @override
  State<LoanInputPage> createState() => _LoanInputPageState();
}

class _LoanInputPageState extends State<LoanInputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  //controllers for field inputs
  final companyController = TextEditingController();
  final amountController = TextEditingController();
  final rateController = TextEditingController();
  final timeController = TextEditingController();
  late String selectedType = 'CREDIT_CARD';
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {

    //changing color of the buttons
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

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              5.0,
            ),
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
                      timeController.text,
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
    );
  }
}
