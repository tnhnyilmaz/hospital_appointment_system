import 'package:flutter/material.dart';
import '../../../constant/colors.dart';

// ignore: must_be_immutable
class DropDownContainer extends StatelessWidget {
  IconData dataIcon;
  String textHint;
  String text;
  Widget widget;
  DropDownContainer(
      {super.key,
      required this.dataIcon,
      required this.widget,
      required this.text,
      required this.textHint});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: ProjectColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      dataIcon,
                      size: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(text),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                widget,
              ]),
        ),
      ),
    );
  }
}
