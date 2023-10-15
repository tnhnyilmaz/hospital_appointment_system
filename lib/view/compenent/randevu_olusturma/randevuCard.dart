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
  String textTarih;
  String textSaat;

  RandevuCard(
      {super.key,
      required this.containerColor,
      required this.textTarih,
      required this.textSaat,
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
                const Icon(Icons.person_2_outlined),
                Text(
                  textKullanici,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ]),
              Row(
                children: [
                  const Icon(Icons.medical_services_outlined),
                  Text(
                    textPoliklinik,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.medication_sharp),
                  Text(
                    textPoliklinikYer,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Text(
                "*${randevuTur}",
                style: TextStyle(
                    fontSize: 15,
                    color: randevuTur == "Muayene"
                        ? ProjectColors.yellow
                        : const Color.fromARGB(255, 0, 94, 255)),
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      textTarih,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      textSaat,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
