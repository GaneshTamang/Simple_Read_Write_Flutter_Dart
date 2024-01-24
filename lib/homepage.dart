// ignore_for_file: avoid_print

import 'package:file_handling_examples/filing_directory.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                File mySavedFile = File('lib/rw.txt');

                String contentsInFile = await mySavedFile.readAsString();

                print(contentsInFile);
                await mySavedFile.delete();
              },
              child: const Text('Delete'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await FillingDirectoryEG().createDirectory();
              },
              child: const Text('create'),
            ),
          ),
        ],
      ),
    );
  }

  checkFileAndCreate(String filePath) {
    //create file object
    File checkfile = File(filePath);
    if (checkfile.existsSync()) {
      print('is available');
      return checkfile;
    } else {
      print('nosuch file in directory');
    }
  }
}
