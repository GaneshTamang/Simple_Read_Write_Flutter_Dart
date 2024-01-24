import 'package:flutter/material.dart';

class ProvidingData with ChangeNotifier {
  int _counter = 0;

  int get getcounter {
    return _counter;
  }

  setcounter() {
    _counter++;
    notifyListeners();
  }
}
