import 'package:file_handling_examples/app_delete_add_file.dart';
import 'package:file_handling_examples/app_file_read_write.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppDeleteAddFile fileActions = AppDeleteAddFile();
    return Scaffold(
      body: Center(
        child: Consumer<AppFileREadWrite>(
          builder: (context, providerData, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(providerData.getCurrentFileContent),
                ElevatedButton(
                    onPressed: () async {
                      // AppFileREadWrite fileForReading = AppFileREadWrite();
                      await providerData
                          .readFromSpecifcFile('lib/photos/readme.txt');
                    },
                    child: const Text('FileRW')),
                buttons(fileActions),
              ],
            );
          },
        ),
      ),
    );
  }

  Column buttons(AppDeleteAddFile fileActions) {
    return Column(
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
    );
  }
}
