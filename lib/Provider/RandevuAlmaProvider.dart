import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier {
  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }
}
