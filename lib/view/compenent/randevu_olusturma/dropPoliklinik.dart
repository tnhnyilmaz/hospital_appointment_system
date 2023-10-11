import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/Poliklinikservice.dart';

class DropPoliklinik extends StatefulWidget {
  const DropPoliklinik({super.key});

  @override
  State<DropPoliklinik> createState() => _DropPoliklinikState();
}

class _DropPoliklinikState extends State<DropPoliklinik> {
  late PoliklinikService poliklinikservice;
  List<String?> list = [];
  String? selectedValue;

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
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
          print(selectedValue);
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
