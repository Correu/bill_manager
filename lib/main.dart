import 'package:bill_manager/views/Pages/AccountManagement/account_creation_page.dart';
import 'package:bill_manager/views/Pages/AccountManagement/sign_in_page.dart';
import 'package:bill_manager/views/Widgets/nav_buttons.dart';
import 'package:bill_manager/views/bill_entry.dart';
import 'package:bill_manager/views/calendar.dart';
import 'package:bill_manager/views/payment_list.dart';
import 'package:flutter/material.dart';

///testing authentication
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

///
/// Main Page -
/// Initial Load of Application -
/// swipe between three main pages
/// top bar to sign in, create an account, and sign out
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavMenu(),
    );
  }
}

/*
  Bottom Navigation Bar
*/
class NavMenu extends StatefulWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('Bill Entry'),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const SignInPage();
                      },
                    ),
                  );
                },
                child: const Text('Account Sign In Page'),
              ),
              TextButton(
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
                  "Account Creation Page",
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            children: const <Widget>[
              BillEntry(),
              Calendar(),
              PaymentList(),
            ],
          ),const NavButtons(),
        ],
      ),
    );
  }
}
