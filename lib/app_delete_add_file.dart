// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';

class AppDeleteAddFile with ChangeNotifier {
  String currrentPath = 'lib/photos/readme.txt';
  // File? _fileToRW;
  late String _fileContent = "No file Exists";

  AppDeleteAddFile() {
    readFromFile(currrentPath);
  }

// getter

  String get fileCurrentContents => _fileContent;

  //  To chekc directory folder Exists?
  Future<bool> checkDirectoryExistOnDevice(String directoryTocheck) async {
    Directory fileDirectory = Directory(directoryTocheck);
    if (await fileDirectory.exists() == true) {
      return true;
    } else {
      debugPrint('No folder/file named $directoryTocheck');
      return false;
    }
  }

//check directory and create
  Future<void> createFolderWithDirectory(String photosFolder) async {
    bool checkFolder = await checkDirectoryExistOnDevice(photosFolder);
    //! here check T/F ? If T do:else Do this;
    if (!checkFolder) {
      debugPrint(
          "folder not found on path : $photosFolder  So folder created ");
      Directory creatingDir = Directory(photosFolder);
      await creatingDir.create(recursive: true);
    } else {
      debugPrint("folder found on : $photosFolder");
    }
  }

  Future<bool> checkFileExistsonPath(String filePath) async {
    String filePathToCheck = filePath;
    File checkFile = File(filePathToCheck);
    bool fileExists = await checkFile.exists();

    if (!fileExists) {
      print('fileDidnt exist on path at $filePathToCheck');
      return false;
    } else {
      print('file found on path: $filePathToCheck');
      return true;
    }
  }

  Future<void> createFileOnSpecificDirectory(
      {required String whereToCreate,
      required String fileNAme,
      required String fileExtension}) async {
    //check Folder exists?
    String direcTory = whereToCreate;
    String fileNAmeToCreate = fileNAme;
    String extension = fileExtension;
    bool checkFileDirectory = await checkFileExistsonPath(
        "$whereToCreate/$fileNAmeToCreate.$extension");

    if (!checkFileDirectory) {
      await createFolderWithDirectory(whereToCreate);

      File creatingFile = File('$direcTory/$fileNAmeToCreate.$extension');
      await creatingFile.writeAsString(
          "Helllooooooooooooooooooooooooo Worrlllllllllllllllld");
      await creatingFile.create(
        recursive: true,
      );
      debugPrint('created at Path: ${creatingFile.path}');
      await readFromFile(currrentPath);
      notifyListeners();
    } else {
      debugPrint("file found : $fileNAmeToCreate/$fileNAmeToCreate.$extension");
    }
  }

//since file cannot be detected from directory method so   checking specific file and deleting
  Future<void> deleteSpecificFile(
      {required String whereToDelete,
      required String fileNAme,
      required String fileExtension}) async {
    String filePath = '$whereToDelete/$fileNAme.$fileExtension';
    File fileToDelete = File(filePath);
    bool fileFound = await fileToDelete.exists();
    if (!fileFound) {
      debugPrint("No file Found  of Such name  : $fileNAme.$fileExtension");
      _fileContent = "no file found ";
      notifyListeners();
    } else {
      debugPrint(
          "File deleted on path :$whereToDelete $fileNAme.$fileExtension");
      fileToDelete.delete(recursive: true);
      _fileContent = "deleted File";
      notifyListeners();
    }
  }

  Future<void> deletFolderFromDirectory(String directoryFileToDelete) async {
    bool checkFileExist =
        await checkDirectoryExistOnDevice(directoryFileToDelete);
    if (!checkFileExist) {
      debugPrint(
          "No file Found  at :$directoryFileToDelete delete FileDoesntExists");
      _fileContent = "no File to Delete";
      notifyListeners();
    } else {
      File fileToDelete = File(directoryFileToDelete);
      await fileToDelete.delete(recursive: true);
      _fileContent = "File Deleted";
      notifyListeners();
    }
  }

  Future<void> readFromFile(String filePathToRead) async {
    File toReadFile = File(filePathToRead);

    bool containsFile = await checkFileExistsonPath(filePathToRead);

    //if false
    if (containsFile == true)
    // if true
    {
      _fileContent = await toReadFile
          .readAsString(); // Put the whole file in a single string.
      String content = await toReadFile.readAsString();
      _fileContent = content;

      notifyListeners();
    } else {
      _fileContent = "no File To read";
      notifyListeners();
    }
  }

  writeInFile(String directorTowirte, String whatToWrite) {}
}
