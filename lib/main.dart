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
  bool isBusy = false;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x338ccdff),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          PageView(
            children: const <Widget>[
              BillEntry(),
              Calendar(),
              PaymentList(),
            ],
          ),
          const NavButtons(),
        ],
      ),
    );
  }
}
