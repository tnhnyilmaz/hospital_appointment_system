import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_2/model/poliklinikModel.dart';

import 'http_serivce.dart';

class PoliklinikService {
  List<PoliklinikModel> poliklinikler = [];
  List<String?> poliklinikAdlari = [];
  String poliklinikList = "/api/Poliklinik/PoliklinikList";
  Future<List<PoliklinikModel>> GetPoliklinikList() async {
    final response = await HttpService().getRequest(poliklinikList);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final poliklinikList =
          jsonList.map((json) => PoliklinikModel.fromJson(json)).toList();
      poliklinikler = poliklinikList;
      return poliklinikler;
    } else {
      throw e;
    }
  }
}
