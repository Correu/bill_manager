import 'package:flutter/material.dart';

class RentEntryPage extends StatefulWidget {
  const RentEntryPage({Key? key}) : super(key: key);

  @override
  State<RentEntryPage> createState() => _RentEntryPageState();
}

class _RentEntryPageState extends State<RentEntryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the Company",
                  ),
                  controller: companyController,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
