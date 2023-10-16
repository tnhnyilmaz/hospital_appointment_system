import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/HastaneService.dart';
import 'package:flutter_application_2/city%20to%20plakaNo/citytoplaka.dart';
import 'package:provider/provider.dart';

import '../../../Provider/RandevuAlmaProvider.dart';

class DropHastane extends StatefulWidget {
  const DropHastane({super.key});

  @override
  State<DropHastane> createState() => _DropHastaneState();
}

class _DropHastaneState extends State<DropHastane> {
  late HastaneService hastaneService;
  List<String?> list = [];
  String? selectedValue;
  String? selectedHastane;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initState yorum satırına alındı
    // initState() {
    // super.initState();
    hastaneService = HastaneService();
    String selectedCity =
        Provider.of<RandevuAlmaProvider>(context).selectedCity ?? '';
    print("seçilen city hastane dropdown :${selectedCity}");
    String getCity = CityToPlaka().findPlakaNo(selectedCity);
    hastaneService.GetSelectedCityHastane(getCity).then((hastaneler) {
      setState(() {
        selectedHastane = null;
        list = hastaneler.map((e) => e.hastaneAdi).toList();
      });
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedHastane,
      onChanged: (String? newValue) {
        Provider.of<RandevuAlmaProvider>(context, listen: false)
            .setSelectedHospital(newValue);
        setState(() {
          if (list.contains(newValue)) {
            selectedHastane = newValue;
            print("selectedHastane: ${selectedHastane}");
          } else {
            // Seçilen değer `list` içinde yoksa, selectedValue'yu temizle
            selectedValue = null;
          }
        });
      },

      items: list.map<DropdownMenuItem<String>>((String? value) {
        String displayedText = value ?? "";
        if (displayedText.length > 35) {
          displayedText = displayedText.substring(0, 35); // İlk 35 karakteri al
        }
        return DropdownMenuItem<String>(
          value: value,
          child: Text(displayedText),
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
