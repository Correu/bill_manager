import 'package:flutter/material.dart';

class InvalidLoginWidget extends StatelessWidget {
  const InvalidLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Invalid Login Attempt",
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Test"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
