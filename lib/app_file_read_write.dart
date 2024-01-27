// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_handling_examples/app_delete_add_file.dart';
import 'package:flutter/material.dart';

class AppFileREadWrite with ChangeNotifier {
  // private

  String _fileContent = "No file Exists";

  // getters

  String get getCurrentFileContent => _fileContent;

// Setters

  Future<void> readFromSpecifcFile(String filePathToRead) async {
    File toReadFile = File(filePathToRead);

    AppDeleteAddFile checkFil = AppDeleteAddFile();
    bool containsFile = await checkFil.checkFileExistsonPath(filePathToRead);

    if (containsFile == true)
    // if true
    {
      _fileContent = await toReadFile
          .readAsString(); // Put the whole file in a single string.
      String content = await toReadFile.readAsString();
      _fileContent = content;
      notifyListeners();
      print(
          'The file is ${_fileContent.length} characters long.\n Contents: $_fileContent');

      // Put each line of the file into its own string.
      List<String> lines = await toReadFile.readAsLines();
      print('The file is ${lines.length} lines long.\n $_fileContent');
      notifyListeners();
    } else {
      _fileContent = "no File To read";
      notifyListeners();
    }
    notifyListeners();
  }
}
