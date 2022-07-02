import 'package:bill_manager/views/Pages/AccountManagement/account_creation_page.dart';
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
/// Handles page navigation, containing the bottom nav bar and the drawer side nav.
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
  int _selectedIndex = 0;

  final List<Widget> _children = <Widget>[
    const BillEntry(),
    const Calendar(),
    const PaymentList(),
  ];

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
                        return const AccountCreation();
                      },
                    ),
                  );
                },
                child: const Text('Creation Page'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Enter Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Current Period',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Payment List',
          )
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _children[_selectedIndex],
    );
  }
}
