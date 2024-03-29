import 'package:bill_manager/views/Widgets/nav_buttons.dart';
import 'package:bill_manager/views/bill_entry.dart';
import 'package:bill_manager/views/calendar.dart';
import 'package:bill_manager/views/payment_list.dart';
import 'package:flutter/material.dart';

///testing authentication
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: BillManager(),
    );
  }
}

class BillManager extends StatefulWidget {
  const BillManager({Key? key}) : super(key: key);

  @override
  State<BillManager> createState() => _BillManagerState();
}

class _BillManagerState extends State<BillManager> {
  bool isBusy = false;
  bool isLoggedIn = false;

  //this and initState handle the storing of keys for authentication and intial page displays according to signin status
  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("access_token") != null) {
      isLoggedIn = true;
    }
  }
  
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
