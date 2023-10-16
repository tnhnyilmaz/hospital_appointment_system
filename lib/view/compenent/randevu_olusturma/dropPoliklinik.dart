import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/RandevuAlmaProvider.dart';
import 'package:flutter_application_2/Services/Poliklinikservice.dart';
import 'package:provider/provider.dart';

class DropPoliklinik extends StatefulWidget {
  const DropPoliklinik({super.key});

  @override
  State<DropPoliklinik> createState() => _DropPoliklinikState();
}

class _DropPoliklinikState extends State<DropPoliklinik> {
  late PoliklinikService poliklinikservice;
  List<String?> list = [];
  String? selectedPoliklinik;

  @override
  void initState() {
    super.initState();
    poliklinikservice = PoliklinikService();
    poliklinikservice.GetPoliklinikList().then((poliklinikler) {
      setState(() {
        list = poliklinikler.map((poli) => poli.poliklinikName).toList();
        poliklinikservice.poliklinikAdlari = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedPoliklinik,
      onChanged: (String? newValue) {
        Provider.of<RandevuAlmaProvider>(context, listen: false)
            .setSelectedPoliklinik(newValue);
        setState(() {
          selectedPoliklinik = newValue;
          print("selectedCity: ${selectedPoliklinik}");
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
