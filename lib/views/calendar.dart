import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

///
/// Calendar -
/// Widget used to display the users required payments/saving goals for the current month.
///
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x338ccdff),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(
              DateTime.now().year,
              DateTime.now().month - 1,
              DateTime.now().day,
            ),
            lastDay: DateTime(
              DateTime.now().year,
              DateTime.now().month + 1,
              DateTime.now().day,
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              }
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SleekCircularSlider(
                    appearance: const CircularSliderAppearance(),
                    onChange: (double value) {
                      debugPrint('$value');
                    },
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    child: const Text(
                      "Remaining income after this months bills",
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: [
                  SleekCircularSlider(
                    appearance: const CircularSliderAppearance(
                      angleRange: 360,
                    ),
                    onChange: (double value) {
                      debugPrint('$value');
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
