import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String text;
  const MenuCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: ProjectColors.white,
      child: SizedBox(
        width: width * 0.40,
        height: height * 0.15,
        child: Row(
          children: [
            Image.network(
              image,
              height: height * 0.07,
              width: width * 0.20,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: ProjectColors.black),
            )
          ],
        ),
      ),
    );
  }
}
