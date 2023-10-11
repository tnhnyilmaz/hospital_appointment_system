import 'package:flutter/material.dart';

class HomePageRandevuCard extends StatelessWidget {
  final Color containerColor;
  final String image;
  final Color textColor;
  final String text;
  const HomePageRandevuCard(
      {super.key,
      required this.containerColor,
      required this.image,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        width: width,
        height: height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: Container(
                height: height * 0.12,
                width: 20,
                color: containerColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Image.network(
              image,
            ),
            const SizedBox(
              width: 25,
            ),
            Center(
                child: Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: textColor)))
          ],
        ),
      ),
    );
  }
}
