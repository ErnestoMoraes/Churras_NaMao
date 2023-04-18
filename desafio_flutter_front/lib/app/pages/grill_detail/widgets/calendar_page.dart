// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reserva_churas/app/models/rent_model.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_controller.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_state.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';

class CalendarPage extends StatefulWidget {
  final List<RentModel> selectedDates;
  const CalendarPage({
    super.key,
    required this.selectedDates,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late List<DateTime> dates = [];
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //
    // final CalendarBuilders calendarBuilders =
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
      markerDecoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
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

    //
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
      markerBuilder: (context, day, events) {
        if (dates.contains(day)) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 2.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );

    return BlocBuilder<GrillDetailController, GrillDetailState>(
      builder: (context, state) {
        var datas = state.rents.map((e) => DateTime.parse(e.dateRent)).toList();
        dates = datas;
        print('datas ==> $datas');
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
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    if (selectedDay.isBefore(DateTime.now())) {
                      today = DateTime.now();
                      state.selectedDay = today.toString();
                    } else {
                      today = selectedDay;
                      state.selectedDay = today.toString();
                    }
                  });
                },
                selectedDayPredicate: (day) => isSameDay(today, day),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.colorsApp.white,
                ),
                child: Text(
                  'Dia selecionado: ${DateFormat('dd/MM/yyyy').format(today)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
