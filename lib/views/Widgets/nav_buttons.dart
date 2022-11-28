import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text(
          "Left Side",
        ),
        Text(
          "Right Side",
        )
      ],
    );
  }
}
