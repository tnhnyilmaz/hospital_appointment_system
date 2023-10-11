import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';

class TimePick extends StatefulWidget {
  const TimePick({super.key});

  @override
  State<TimePick> createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  late TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = null;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return OutlinedButton(
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          setState(() {
            selectedTime = picked; // Seçilen tarihi atayın
            print("Seçilen Saat: ${selectedTime}");
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
              selectedTime == null
                  ? "Saat Seçiniz"
                  : selectedTime!.format(context).toString(),
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
