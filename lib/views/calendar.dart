import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Month'),
      ),
      body: TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day), lastDay: DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day)),
    );
  }
}
