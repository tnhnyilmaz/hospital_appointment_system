import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return OutlinedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ??
              DateTime.now(), // selectedDate nullsa, şu anki tarihi kullanın
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          setState(() {
            selectedDate = picked; // Seçilen tarihi atayın
            print("Seçilen tarih: ${selectedDate}");
          });
        }
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1, color: ProjectColors.black.withOpacity(0.3)),
      ),
      child: Container(
        height: 55.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? "Tarih Seçiniz"
                  : DateFormat('dd/MM/yyyy').format(selectedDate!),
              style: TextStyle(color: ProjectColors.black.withOpacity(0.5)),
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: ProjectColors.black.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
