import 'package:flutter/material.dart';

class LoanInfoDisplay extends StatefulWidget {
  const LoanInfoDisplay({Key? key}) : super(key: key);

  @override
  State<LoanInfoDisplay> createState() => _LoanInfoDisplayState();
}

class _LoanInfoDisplayState extends State<LoanInfoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loan info',
        ),
      ),
      body: TextButton(
        child: const Text(
          'Return',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
