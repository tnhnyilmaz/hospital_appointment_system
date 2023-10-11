import 'package:flutter/material.dart';
import '../../../constant/colors.dart';

// ignore: must_be_immutable
class RandevuCard extends StatelessWidget {
  String randevuDurumu;
  String randevuTur;
  Color containerColor;
  String textHastane;
  String textKullanici;
  String textPoliklinik;
  String textPoliklinikYer;
  RandevuCard(
      {super.key,
      required this.containerColor,
      required this.textPoliklinik,
      required this.textPoliklinikYer,
      required this.textKullanici,
      required this.textHastane,
      required this.randevuTur,
      required this.randevuDurumu});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: width * 0.85,
        height: height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildeContainer(height),
              Text(
                textHastane.toUpperCase(),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              Row(children: [
                Icon(Icons.person_2_outlined),
                Text(
                  textKullanici,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ]),
              Row(
                children: [
                  Icon(Icons.medical_services_outlined),
                  Text(
                    textPoliklinik,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.medication_sharp),
                  Text(
                    textPoliklinikYer,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Text(
                "*${randevuTur}",
                style: TextStyle(
                    fontSize: 15,
                    color: randevuTur == "Muayene"
                        ? ProjectColors.yellow
                        : Color.fromARGB(255, 0, 94, 255)),
              ),
              Text(
                "*${randevuDurumu} ",
                style: TextStyle(
                    fontSize: 15,
                    color: randevuDurumu == "Gelecek Randevu"
                        ? ProjectColors.green
                        : Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildeContainer(double height) {
    return Container(
      height: height * 0.1,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("25",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Ağustos 2022",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "13:50",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
