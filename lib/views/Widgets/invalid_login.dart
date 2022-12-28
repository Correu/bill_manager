import 'package:flutter/material.dart';

class InvalidLoginWidget extends StatelessWidget {
  const InvalidLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Invalid Login Attempt",
      ),
      content: const SingleChildScrollView(
        child: Text(
          "Test",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "test",
          ),
        ),
      ],
    );
  }
}
