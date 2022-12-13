import 'package:bill_manager/views/Pages/AccountManagement/account_creation_page.dart';
import 'package:bill_manager/views/Pages/Misc/history_widget.dart';
import 'package:flutter/material.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "HistoryBtn",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const HistoryWidget();
                      },
                    ),
                  );
                },
                child: const Text(
                  "History",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3.3,
                ),
              ),
              FloatingActionButton(
                heroTag: "AccountButton",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const AccountCreation();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Menu",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
