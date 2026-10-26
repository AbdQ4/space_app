import 'package:flutter/material.dart';
import 'package:space_app/model/planet_model.dart';

class PlanetSelector extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectPlanet(int index) {
    if (index < 0 || index >= PlanetModel.planets.length) return;
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
