import 'package:flutter/material.dart';

/// 
/// BillInputPage - 
/// Input page for user to put in standard, flat rate bills (Rent, phone, etc..)
/// 
class BillInputPage extends StatefulWidget {
  const BillInputPage({Key? key}) : super(key: key);

  @override
  State<BillInputPage> createState() => _BillInputPageState();
}

class _BillInputPageState extends State<BillInputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final companyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
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
                //Credit card dropdown select
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.blue,
                    backgroundColor: Color(0x388ccdff),
                  ),
                  items: ["VISA", "MASTER_CARD"].map<DropdownMenuItem<String>>(
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
                      //set state should set the credit card type based on user input
                      debugPrint("test");
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
