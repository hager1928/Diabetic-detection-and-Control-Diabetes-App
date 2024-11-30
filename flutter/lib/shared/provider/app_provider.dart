import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  double calories = 0.0;
  changeCal(double val) {
    calories = val;
    notifyListeners();
  }
}
