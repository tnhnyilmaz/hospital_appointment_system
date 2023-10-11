import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';
import '../compenent/bottomAppBar.dart';
import '../compenent/homeBottomRandevuYok.dart';
import '../compenent/homepageCard.dart';
import '../compenent/merhabaText.dart';
import '../compenent/searchInput.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ProjectColors.backgroundGrey.withOpacity(0.7),
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MerhabaText(),
                const SizedBox(
                  height: 15,
                ),
                const SearchInput(),
                const SizedBox(
                  height: 55,
                ),
                buildRandevuCard(),
                const SizedBox(
                  height: 25,
                ),
                Divider(
                  color: ProjectColors.black.withOpacity(0.6),
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 0,
                ),
                const HomeRandevuYok(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabBar(),
    );
  }

  Wrap buildRandevuCard() {
    return Wrap(
      runSpacing: 15,
      children: [
        const HomePageRandevuCard(
            containerColor: ProjectColors.yellow,
            image: "https://pngimg.com/uploads/vaccine/small/vaccine_PNG14.png",
            text: "Aşı Randevusu",
            textColor: ProjectColors.yellow),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/hastaneRandevu');
          },
          child: const HomePageRandevuCard(
            containerColor: ProjectColors.green,
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Eo_circle_green_white_letter-h.svg/2048px-Eo_circle_green_white_letter-h.svg.png",
            text: "Hastane Randevusu",
            textColor: ProjectColors.green,
          ),
        )
      ],
    );
  }
}
