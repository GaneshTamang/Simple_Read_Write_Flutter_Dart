// ignore_for_file: avoid_print

import 'package:file_handling_examples/filing_directory.dart';
import 'package:file_handling_examples/providing_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentHomePageContext = context;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ProvidingData>(
              builder: (context, providerValue, widgetCreated) {
            return FutureBuilder(
              future: providerValue.getData,
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return Text(snapshot.data ?? "empty");
                }
              }),
            );
          }),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await FillingDirectoryEG().deletefile();
                  } catch (e) {
                    if (currentHomePageContext.mounted) {
                      ScaffoldMessenger.of(currentHomePageContext)
                          .showSnackBar(SnackBar(
                        content: Text(e.toString()),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  }
                },
                child: const Text('Delete'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await FillingDirectoryEG().createDirectory(context);
                  } catch (e) {
                    if (currentHomePageContext.mounted) {
                      ScaffoldMessenger.of(currentHomePageContext)
                          .showSnackBar(SnackBar(
                        content: Text(e.toString()),
                        duration: const Duration(seconds: 2),
                      ));
                    }
                  }
                },
                child: const Text('create'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
