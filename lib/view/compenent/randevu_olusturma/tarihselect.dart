import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/Provider/RandevuAlmaProvider.dart';
import 'package:flutter_application_2/constant/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<RandevuAlmaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: ProjectColors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _tableCalendar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: Center(
                      child: Text(
                        "Tarih Seçiniz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _isWeekend
                ? SliverToBoxAdapter(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      alignment: Alignment.center,
                      child: Text(
                        "Haftasonuna randevu alamazsınız!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              _timeSelected = true;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? ProjectColors.green
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${index + 9}:00 ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _currentIndex == index
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1.5)),
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  String selectMonth = ayYazdirma(_currentDay.month);
                  print(selectMonth);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Randevu Onay"),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      "${_currentDay.day} ${selectMonth} ${_currentDay.year}"),
                                  if (_timeSelected)
                                    Text(
                                        "Seçilen Saat: ${(9 + _currentIndex!).toString().padLeft(2, '0')}:00"),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      dateProvider.setDate(_currentDay);
                                      dateProvider.setTimeIndex(_currentIndex);
                                      Navigator.pushNamed(
                                          context, "/hastaneRandevu");
                                    },
                                    child: Text(
                                      "ONAYLA",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ProjectColors.green,
                                    ),
                                  )
                                ]),
                          ),
                        );
                      });
                },
                child: Text(
                  'Tarih Seç',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ProjectColors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      rowHeight: 48,
      currentDay: _currentDay,
      calendarStyle: CalendarStyle(
        todayDecoration:
            BoxDecoration(color: ProjectColors.green, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
        });
        if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
          _isWeekend = true;
          _timeSelected = false;
          _currentIndex = null;
        } else {
          _isWeekend = false;
        }
      },
    );
  }

  String ayYazdirma(int ay) {
    String ayText = "";
    if (ay == 1)
      ayText = "Ocak";
    else if (ay == 2)
      ayText = 'Şubat';
    else if (ay == 3)
      ayText = 'Mart';
    else if (ay == 4)
      ayText = 'Nisan';
    else if (ay == 5)
      ayText = 'Mayıs';
    else if (ay == 6)
      ayText = 'Haziran';
    else if (ay == 7)
      ayText = 'Temmuz';
    else if (ay == 8)
      ayText = 'Ağustos';
    else if (ay == 9)
      ayText = 'Eylül';
    else if (ay == 10)
      ayText = 'Ekim';
    else if (ay == 11)
      ayText = 'Kasım';
    else if (ay == 12) ayText = 'Aralık';
    return ayText;
  }
}
