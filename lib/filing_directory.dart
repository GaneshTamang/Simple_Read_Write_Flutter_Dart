// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_handling_examples/providing_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FillingDirectoryEG with ChangeNotifier {
  Directory fileDire = Directory('lib/');
  String fileName = 'rw.txt';

  String createfullFilePathWithDirective() {
    String fullFilePath = "${fileDire.path}$fileName";
    return fullFilePath;
  }

  Future createDirectory(BuildContext context) async {
    if (await checkFileExistOnpath(createfullFilePathWithDirective()) ==
        false) {
      await fileDire.create(recursive: true);
      print(fileDire);
      File createdfile = File('${fileDire.path}$fileName');
      print(createdfile);
      await createdfile.create();
      createdfile.writeAsString('hellow world' +
          "pressed :times" +
          ProvidingData().getcounter.toString());
      ProvidingData().setcounter();
      notifyListeners();
    } else {
      File createdfile = File('${fileDire.path}$fileName');
      createdfile.writeAsString('hellow world' +
          "pressed :times" +
          ProvidingData().getcounter.toString());
      ProvidingData().setcounter();
      createdfile.writeAsString('hellow world' +
          "pressed :times" +
          Provider.of<ProvidingData>(context).getcounter.toString());
      notifyListeners();
      throw 'already exists path file';
    }
    notifyListeners();
  }

  Future deletefile() async {
    File deleteFile = File(createfullFilePathWithDirective());
    if (await checkFileExistOnpath(createfullFilePathWithDirective()) ==
        false) {
      notifyListeners();
      throw " file doesnt exists  to delete";
    } else {
      await deleteFile.delete();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<bool> checkFileExistOnpath(String checkPath) async {
    if (await File(checkPath).exists() == true) {
      return true;
    } else {
      return false;
    }
  }

//   Future<String> _getDocumentsPath() async {
//   // Determine the app's documents directory
//   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   return appDocumentsDirectory.path;
// }
}
