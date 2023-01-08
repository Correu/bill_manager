import 'package:flutter/material.dart';

class InvalidLoginWidget extends StatelessWidget {
  const InvalidLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Invalid Login Attempt",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "test",
          ),
        ),
      ],
    );
  }
}
