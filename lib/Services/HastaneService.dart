import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_2/model/HastaneModel.dart';

import 'http_serivce.dart';

class HastaneService {
  String hastaneInfo = "/api/Hastane/HastaneInfo";
  String fitredCity = "/api/Hastane/selectedCity?selectedCity=";
  List<HastaneModel> hastaneler = [];
  List<String?> HastaneAdlari = [];

  Future<List<HastaneModel>> GetHastaneInfo() async {
    final response = await HttpService().getRequest(hastaneInfo);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final hastaneList =
          jsonList.map((json) => HastaneModel.fromJson(json)).toList();
      hastaneler = hastaneList;
      return hastaneler;
    } else {
      throw e;
    }
  }

  Future<List<HastaneModel>> GetSelectedCityHastane(String selectedcity) async {
    final response = await HttpService().getRequest(fitredCity + selectedcity);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final hastaneList =
          jsonList.map((json) => HastaneModel.fromJson(json)).toList();
      hastaneler = hastaneList;
      return hastaneler;
    } else {
      throw e;
    }
  }
}
