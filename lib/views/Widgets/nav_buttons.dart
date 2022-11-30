import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          child: const Text(
            "Menu",
          ),
        ),
        const Text(
          "Left Side",
        ),
        const Text(
          "Right Side",
        )
      ],
    );
  }
}
