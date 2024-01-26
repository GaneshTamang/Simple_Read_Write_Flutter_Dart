import 'package:file_handling_examples/app_read_write.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppReadWrite fileActions = AppReadWrite();
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await fileActions.createFolderWithDirectory('lib/photos');
            },
            child: const Text('press to crete Folder'),
          ),
          ElevatedButton(
            onPressed: () async {
              await fileActions.createFileOnSpecificDirectory(
                  whereToCreate: 'lib/photos',
                  fileNAme: 'readme',
                  fileExtension: 'txt');
            },
            child: const Text('create text file'),
          ),
          ElevatedButton(
            onPressed: () async {
              await fileActions.deleteSpecificFile(
                  whereToDelete: 'lib/photos',
                  fileNAme: 'readme',
                  fileExtension: 'txt');
            },
            child: const Text('deletee text file'),
          ),
          ElevatedButton(
            onPressed: () async {
              await fileActions.deletFolderFromDirectory('lib/photos');
            },
            child: const Text('delete folder'),
          ),
        ],
      ),
    );
  }
}
