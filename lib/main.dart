import 'package:file_handling_examples/homepage.dart';
import 'package:file_handling_examples/providing_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ProviderDataForApp(),
      ),
    ],
    child: const FileHandlingApp(),
  ));
}

class FileHandlingApp extends StatelessWidget {
  const FileHandlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
