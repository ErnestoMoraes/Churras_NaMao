// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final CalendarBuilders calendarBuilders = CalendarBuilders(
      dowBuilder: (context, day) {
        String text;
        switch (day.weekday) {
          case 1:
            text = 'Seg';
            break;
          case 2:
            text = 'Ter';
            break;
          case 3:
            text = 'Qua';
            break;
          case 4:
            text = 'Qui';
            break;
          case 5:
            text = 'Sex';
            break;
          case 6:
            text = 'Sab';
            break;
          case 7:
            text = 'Dom';
            break;
          default:
            text = '';
        }
        return Center(
          child: Text(
            text,
            style: TextStyle(
              color: context.colorsApp.white,
              fontSize: 16,
            ),
          ),
        );
      },
    );
    final HeaderStyle headerStyle = HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      headerPadding: EdgeInsets.zero,
      titleTextFormatter: (date, locale) {
        String text;
        switch (date.month) {
          case 1:
            text = 'Janeiro';
            break;
          case 2:
            text = 'Fevereiro';
            break;
          case 3:
            text = 'Março';
            break;
          case 4:
            text = 'Abril';
            break;
          case 5:
            text = 'Maio';
            break;
          case 6:
            text = 'Junho';
            break;
          case 7:
            text = 'Julho';
            break;
          case 8:
            text = 'Agosto';
            break;
          case 9:
            text = 'Setembro';
            break;
          case 10:
            text = 'Outubro';
            break;
          case 11:
            text = 'Novembro';
            break;
          case 12:
            text = 'Dezembro';
            break;
          default:
            text = '';
        }
        return '$text ${date.year}';
      },
      titleTextStyle: TextStyle(
        color: context.colorsApp.white,
        fontSize: 20,
      ),
      leftChevronIcon: const Icon(
        Icons.chevron_left,
        color: Colors.white,
        size: 35,
      ),
      rightChevronIcon: const Icon(
        Icons.chevron_right,
        color: Colors.white,
        size: 35,
      ),
    );
    final CalendarStyle calendarStyle = CalendarStyle(
      outsideDaysVisible: false,
      selectedDecoration: BoxDecoration(
        color: context.colorsApp.primary,
        shape: BoxShape.circle,
      ),
      selectedTextStyle: TextStyle(
        color: context.colorsApp.white,
        fontWeight: FontWeight.bold,
      ),
      todayDecoration: BoxDecoration(
        color: context.colorsApp.white,
        shape: BoxShape.circle,
      ),
      todayTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      weekendTextStyle: TextStyle(color: context.colorsApp.white),
      defaultTextStyle: TextStyle(color: context.colorsApp.white),
    );

    void onDaySelected(DateTime day, DateTime focusedDay) {
      setState(() {
        if (day.isBefore(DateTime.now())) {
          today = DateTime.now();
        } else {
          today = day;
        }
      });
    }

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colorsApp.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(today.year, 1, 1),
            lastDay: DateTime(today.year, 12, 31),
            rowHeight: context.screenWidth * 0.1,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            headerStyle: headerStyle,
            calendarStyle: calendarStyle,
            calendarBuilders: calendarBuilders,
            onDaySelected: onDaySelected,
            selectedDayPredicate: (day) => isSameDay(today, day),
          ),
          Text('Selected Day =' + today.toString().split(" ")[0])
        ],
      ),
    );
  }
}
