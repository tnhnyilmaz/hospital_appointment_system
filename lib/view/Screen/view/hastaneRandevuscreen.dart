import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/RandevuAlmaProvider.dart';
import 'package:flutter_application_2/view/compenent/dropdown.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/calendar.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropCity.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropDoctor.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropHastane.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/dropPoliklinik.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/tarihselect.dart';
import 'package:flutter_application_2/view/compenent/randevu_olusturma/timepicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../constant/colors.dart';
import '../../compenent/bottomAppBar.dart';
import '../../compenent/randevu_olusturma/randevuDropContainer.dart';

class HastaneRandevuScreen extends StatelessWidget {
  const HastaneRandevuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final dateProvider = Provider.of<RandevuAlmaProvider>(context);

    DateTime selectedDate = dateProvider.selectedDate;
    int? selectedTimeIndex = dateProvider.selectedTimeIndex;

    // ignore: unnecessary_null_comparison
    bool tarihSecildiMi = selectedDate != null;

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
                                tarihSecildiMi
                                    ? DateFormat(
                                            'dd MMMM yyyy                                                            ')
                                        .format(selectedDate)
                                    : "Tarih Seçiniz",
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
                        widget: DropDoctor(),
                        text: "Hekim",
                        textHint: "Hekim Seçiniz"),
                    randevuOnayButton(context)
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: const BottomTabBar(),
    );
  }

  Container randevuOnayButton(BuildContext context) {
    final randevuProvider = Provider.of<RandevuAlmaProvider>(context);
    final city = randevuProvider.selectedCity;
    final poliklinik = randevuProvider.selectedPoliklinik;
    final hospital = randevuProvider.selectedHospital;
    final doctor = randevuProvider.selectedDoctor;
    print("işlemlerrrrrrr");
    print(city);
    print(poliklinik);
    print(hospital);
    print(hospital);
    print(doctor);

    if (city == null ||
        poliklinik == null ||
        hospital == null ||
        doctor == null) {
      // Veriler eksikse, bir işlem yapmayın veya bir hata mesajı gösterin
      return Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
          onPressed: () {
            // Hata mesajı gösterebilirsiniz
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Hata"),
                  content: Text("Lütfen tüm bilgileri seçin."),
                );
              },
            );
          },
          label: Text(
            'Randevu Onayla',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.check_box_rounded,
            color: Colors.white,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.grey), // Gri renkte devre dışı bırakabilirsiniz
          ),
        ),
      );
    }

    // Eğer tüm veriler mevcutsa, randevu onay düğmesini etkinleştirin
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Randevu Onay"),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(city),
                      Text(poliklinik),
                      Text(hospital),
                      Text(doctor),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            randevuProvider.clearData();
                            Future.delayed(Duration.zero, () {
                              Navigator.pushNamed(context, '/hastaneRandevu');
                            });
                          },
                          child: Text("onay"))
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text(
          'Randevu Onayla',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.check_box_rounded,
          color: Colors.white,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ProjectColors.green),
        ),
      ),
    );
  }
}
