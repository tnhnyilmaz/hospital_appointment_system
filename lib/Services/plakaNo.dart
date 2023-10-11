import 'dart:convert';
import 'package:flutter_application_2/model/PlakaNo.dart';
import 'http_serivce.dart';

class PlakaNoService {
  List<PlakaNo> iller = [];
  List<String?> ilAdlari = [];
  String endpoint = "/api/IPlakaNo";

  Future<List<PlakaNo>> GetCityNames() async {
    final response = await HttpService().getRequest(endpoint);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final randevuList =
          jsonList.map((json) => PlakaNo.fromJson(json)).toList();
      iller = randevuList;
      return iller;
    } else {
      throw Exception(
          "Hata oluştu"); // Hata mesajını burada özelleştirebilirsiniz.
    }
  }

  void initializeIlAdlari(List<String?> ilAdiList) {
    ilAdlari = ilAdiList;
  }
}
