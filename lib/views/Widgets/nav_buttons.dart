import 'package:bill_manager/views/Pages/AccountManagement/account_creation_page.dart';
import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(
            10.0,
          ),
        ),
        FloatingActionButton(
          onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const AccountCreation();
                      },
                    ),
                  );},
          child: const Text(
            "Menu",
          ),
        ),
      ],
    );
  }
}
