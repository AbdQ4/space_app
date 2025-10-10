import 'package:flutter/material.dart';
import 'package:space_app/model/planet_model.dart';

class PlanetSelector extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectPlanet(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void nextPlanet(int index) {
    if (selectedIndex < PlanetModel.planets.length - 1) {
      _selectedIndex++;
      notifyListeners();
    }
  }

  void previosPlanet(int index) {
    if (_selectedIndex > 0) {
      _selectedIndex--;
      notifyListeners();
    }
  }
}
