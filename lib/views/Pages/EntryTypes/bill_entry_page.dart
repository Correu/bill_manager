import 'package:flutter/material.dart';

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
      key:_formKey,
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
              ))
            ],
          ),
        ],
      ),
    );
  }
}
