import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_2/Services/http_serivce.dart';
import 'package:flutter_application_2/model/DoctorModel.dart';

class DoctorService {
  String fitredDoctor1 = "/api/Doctor/DoctorFiltred?selectedPoliklinik=";
  String filtredDoctor2 = "&selectedIl=";
  String filtredDoctor3 = "&selectedHospital=";

  List<DoctorModel> doctors = [];
  List<String?> doctorsName = [];

  // ignore: non_constant_identifier_names
  Future<List<DoctorModel>> GetDoctorFiltredCreateRandevu(
      String selectedPoliklinik,
      String selectedCity,
      String selectedHospital) async {
    final response = await HttpService().getRequest(fitredDoctor1 +
        selectedPoliklinik +
        filtredDoctor2 +
        selectedCity +
        filtredDoctor3 +
        selectedHospital);

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonList = jsonDecode(body) as List<dynamic>;

      final doctorList =
          jsonList.map((json) => DoctorModel.fromJson(json)).toList();
      doctors = doctorList;
      return doctors;
    } else {
      throw e;
    }
  }
}
