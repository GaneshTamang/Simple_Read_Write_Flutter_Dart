import 'package:file_handling_examples/app_file_read_write.dart';
import 'package:file_handling_examples/homepage.dart';
import 'package:file_handling_examples/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderDataForApp(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppFileREadWrite(),
        ),
      ],
      child: const FileHandlingApp(),
    ),
  );
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
