import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/compenent/dropdown.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/calendar.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropCity.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropHastane.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropPoliklinik.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/tarihselect.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/timepicker.dart';
import '../../../constant/colors.dart';
import '../../compenent/bottomAppBar.dart';
import '../../compenent/randevu_olusturma/randevuDropContainer.dart';

class HastaneRandevuScreen extends StatelessWidget {
  const HastaneRandevuScreen({super.key});

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
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    DropDownContainer(
                        dataIcon: Icons.calendar_month,
                        widget: ButtonTheme(
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1,
                                      color: ProjectColors.black
                                          .withOpacity(0.5))),
                              onPressed: () {
                                Navigator.pushNamed(context, 'DateSelect');
                              },
                              child: Text(
                                "Tarih Seçiniz                                                                          ",
                                style: TextStyle(
                                    color: ProjectColors.black.withOpacity(0.6),
                                    fontSize: 15),
                              )),
                        ),
                        text: "Tarih",
                        textHint: "Tarih Seçiniz"),
                    DropDownContainer(
                      dataIcon: Icons.location_on,
                      text: "İl",
                      textHint: "İl Seçiniz",
                      widget: DropCity(),
                    ),
                    DropDownContainer(
                        dataIcon: Icons.bug_report_outlined,
                        widget: DropPoliklinik(),
                        text: "Poliklinik",
                        textHint: "Poliklinik Seçiniz"),
                    DropDownContainer(
                        dataIcon: Icons.h_mobiledata_outlined,
                        widget: DropHastane(),
                        text: "Hastane",
                        textHint: "Hastane Seçiniz"),
                    DropDownContainer(
                        dataIcon: Icons.person_3_rounded,
                        widget: DropDown(),
                        text: "Hekim",
                        textHint: "Hekim Seçiniz"),
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: const BottomTabBar(),
    );
  }
}
