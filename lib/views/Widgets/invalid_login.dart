import 'dart:html';

import 'package:flutter/material.dart';

class InvalidLoginWidget extends StatelessWidget {
  const InvalidLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        "Invalid Login Attempt",
      ),
    );
  }
}
