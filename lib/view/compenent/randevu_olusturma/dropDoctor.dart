import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/RandevuAlmaProvider.dart';
import 'package:flutter_application_2/Services/doctorService.dart';
import 'package:provider/provider.dart';

class DropDoctor extends StatefulWidget {
  const DropDoctor({super.key});

  @override
  State<DropDoctor> createState() => _DropDoctorState();
}

class _DropDoctorState extends State<DropDoctor> {
  late DoctorService doctorService;
  List<String?> list = [];
  String? selectedValue;
  String? selectedDoctor;
  String? selectedCity;
  String? selectedPoliklinik;
  String? selectedHospital;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    doctorService = DoctorService();
    selectedCity = Provider.of<RandevuAlmaProvider>(context).selectedCity;
    selectedPoliklinik =
        Provider.of<RandevuAlmaProvider>(context).selectedPoliklinik;
    selectedHospital =
        Provider.of<RandevuAlmaProvider>(context).selectedHospital;

    // İl ve poliklinik her ikisi de seçildiğinde doktorları getir
    if (selectedCity != null &&
        selectedPoliklinik != null &&
        selectedHospital != null) {
      doctorService.GetDoctorFiltredCreateRandevu(
              selectedPoliklinik!, selectedCity!, selectedHospital!)
          .then((doctors) {
        setState(() {
          selectedDoctor = null;
          list = doctors.map((e) => (e.doktorAdi! + e.doktorSoyadi!)).toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDoctor,
      onChanged: (String? newValue) {
        Provider.of<RandevuAlmaProvider>(context, listen: false)
            .setSelectedDoctor(newValue);
        setState(() {
          selectedDoctor = newValue;
          print(selectedDoctor);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ?? ""),
        );
      }).toList(),
      underline: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: Colors.black.withOpacity(0.4), width: 0.7)),
      ),
      // InputDecoration kullanarak dış çizgiyi özelleştirme
    );
  }
}
