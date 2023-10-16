import 'dart:core';

import 'package:flutter/material.dart';

class RandevuAlmaProvider with ChangeNotifier {
  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  String? _selectedHospital;

  String? get selectedHospital => _selectedHospital;

  void setSelectedHospital(String? hospital) {
    _selectedHospital = hospital;
    notifyListeners();
  }

  String? _selectedPoliklinik;

  String? get selectedPoliklinik => _selectedPoliklinik;

  void setSelectedPoliklinik(String? poliklinik) {
    _selectedPoliklinik = poliklinik;
    notifyListeners();
  }

  String? _selectedDoctor;
  String? get selectedDoctor => _selectedDoctor;
  void setSelectedDoctor(String? doctor) {
    _selectedDoctor = doctor;
    notifyListeners();
  }

  void clearData() {
    _selectedCity = null;
    _selectedPoliklinik = null;
    _selectedHospital = null;
    _selectedDoctor = null;
    notifyListeners();
  }
}
