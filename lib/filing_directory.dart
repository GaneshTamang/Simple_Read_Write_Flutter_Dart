// ignore_for_file: avoid_print

import 'dart:io';

class FillingDirectoryEG {
  Directory fileDir = Directory('lib/');
  String fileName = 'rw.txt';

  Future createDirectory() async {
    await fileDir.create(recursive: true);
    print(fileDir);
    File createdfile = File('${fileDir.path}$fileName');
    print(createdfile);
    await createdfile.create();
  }

//   Future<String> _getDocumentsPath() async {
//   // Determine the app's documents directory
//   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   return appDocumentsDirectory.path;
// }
}
