// ignore: file_names
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class HomeRandevuYok extends StatefulWidget {
  const HomeRandevuYok({super.key});

  @override
  State<HomeRandevuYok> createState() => _HomeRandevuYokState();
}

class _HomeRandevuYokState extends State<HomeRandevuYok> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yakalaşan Randevularım",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ProjectColors.black.withOpacity(0.7)),
        ),
        SizedBox(
          height: 30,
        ),
        const Center(
          child: Icon(
            Icons.calendar_month_outlined,
            size: 120,
          ),
        ),
        Center(
          child: Text("Yaklaşan randevunuz bulunmamaktadır.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ProjectColors.black.withOpacity(0.5))),
        ),
      ],
    );
  }
}
