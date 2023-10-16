import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/plakaNo.dart';
import 'package:provider/provider.dart';

import '../../../Provider/RandevuAlmaProvider.dart';

class DropCity extends StatefulWidget {
  DropCity({Key? key}) : super(key: key);

  @override
  _DropCityState createState() => _DropCityState();
}

class _DropCityState extends State<DropCity> {
  late PlakaNoService plakaNoService;
  List<String?> list = [];
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    plakaNoService = PlakaNoService();
    plakaNoService.GetCityNames().then((iller) {
      setState(() {
        list = iller.map((il) => il.ilAdi).toList();
        plakaNoService.ilAdlari = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCity,
      onChanged: (String? newValue) {
        Provider.of<RandevuAlmaProvider>(context, listen: false)
            .setSelectedCity(newValue);
        setState(() {
          selectedCity = newValue;
          print("selectedCity: ${selectedCity}");
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
