import 'dart:io';

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

  String _data = "";

  Future<String> get getData async {
    try {
      File readingfile = File('lib/rw.txt');
      _data = await readingfile.readAsString();
      return _data;
    } catch (e) {
      return 'error $e';
    }
  }

  // setdata() {}
}
