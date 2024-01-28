import 'package:file_handling_examples/app_delete_add_file.dart';
// import 'package:file_handling_examples/app_file_read_write.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? typedText;
    TextEditingController controllerForTextField = TextEditingController();

    return Scaffold(
      body: Center(
        child: Consumer<AppReadWriteDeleteAddFile>(
          builder: (context, providerData, child) {
            controllerForTextField =
                TextEditingController(text: providerData.fileCurrentContents);
            //! putting  textfield cursor at the last of the  String
            controllerForTextField.selection = TextSelection.fromPosition(
                TextPosition(offset: controllerForTextField.text.length));
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(providerData.fileCurrentContents),
                TextField(
                  controller: controllerForTextField,
                  onChanged: (typeValue) {
                    typedText = typeValue;

                    context
                        .read<AppReadWriteDeleteAddFile>()
                        .writeInFile('lib/photos/readme.txt', typedText!);
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      context
                          .read<AppReadWriteDeleteAddFile>()
                          .writeInFile('lib/photos/readme.txt', typedText!);
                    },
                    child: const Text('FileRW')),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<AppReadWriteDeleteAddFile>()
                            .createFolderWithDirectory('lib/photos');
                      },
                      child: const Text('press to crete Folder'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<AppReadWriteDeleteAddFile>()
                            .createFileOnSpecificDirectory(
                                whereToCreate: 'lib/photos',
                                fileNAme: 'readme',
                                fileExtension: 'txt');
                      },
                      child: const Text('create text file'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<AppReadWriteDeleteAddFile>()
                            .deleteSpecificFile(
                                whereToDelete: 'lib/photos',
                                fileNAme: 'readme',
                                fileExtension: 'txt');
                      },
                      child: const Text('deletee text file'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<AppReadWriteDeleteAddFile>()
                            .deletFolderFromDirectory('lib/photos');
                      },
                      child: const Text('delete folder'),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
