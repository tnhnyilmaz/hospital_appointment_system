import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/plakaNo.dart';

class DropDown extends StatefulWidget {
  DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late PlakaNoService plakaNoService;
  List<String?> list = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // PlakaNoService örneğini başlatın
    plakaNoService = PlakaNoService();

    // PlakaNoService'den il verilerini alın ve listeyi güncelleyin
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
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ?? ""),
        );
      }).toList(),
    );
    // ignore: dead_code
    print("dasda: ${plakaNoService.ilAdlari}");
  }
}
