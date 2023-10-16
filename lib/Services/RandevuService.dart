import 'dart:convert';
import 'dart:math';
import 'package:flutter_application_2/model/randevuModel/RandevuModel.dart';

import 'http_serivce.dart';

class RandevuService {
  List<RandevuModel> randevular = [];
  String randevuInfo = '/RandevuInfo';

// RANDEVU İNFO
  Future<List<RandevuModel>> fetchRandevu() async {
    final response = await HttpService().getRequest(randevuInfo);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final randevuList =
          jsonList.map((json) => RandevuModel.fromJson(json)).toList();
      randevular = randevuList;
      return randevular;
    } else {
      print(e);
      throw e;
    }
  }
}
