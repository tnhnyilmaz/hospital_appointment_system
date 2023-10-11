import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/colors.dart';

import '../compenent/bottomAppBar.dart';
import '../compenent/menuCard.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menü",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ProjectColors.green),
            ),
            const SizedBox(
              height: 20,
            ),
            buildIsim(context),
            const SizedBox(
              height: 18,
            ),
            Divider(
              color: ProjectColors.black.withOpacity(0.6),
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 0,
            ),
            const Row(
              children: [
                MenuCard(
                    image:
                        "https://img2.pngindir.com/20180329/ohq/kisspng-location-computer-icons-symbol-clip-art-location-5abc97afd34d25.2794077115223090398655.jpg",
                    text: "Çevremdeki\n Hastaneler"),
                MenuCard(
                    image:
                        "https://cdn-icons-png.flaticon.com/512/3774/3774299.png",
                    text: "Hekimler"),
              ],
            ),
            const Row(
              children: [
                MenuCard(
                    image:
                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    text: "Profil"),
                MenuCard(
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQYen59w_g5y-Nj-zCiK8b6K-UTqlUE9eQiYGP6-OpwQ&s",
                    text: "Çıkış Yap"),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabBar(),
    );
  }

  Row buildIsim(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ProjectColors.green, width: 3)),
            child: Center(
                child: Text(
              "TY",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ProjectColors.green),
            ))),
        const SizedBox(
          width: 25,
        ),
        Text(
          "Tunahan Yılmaz",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: ProjectColors.green),
        ),
      ],
    );
  }
}
